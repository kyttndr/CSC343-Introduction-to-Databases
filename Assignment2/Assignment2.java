import java.sql.*;
// Remember that part of your mark is for doing as much in SQL (not Java) 
// as you can. At most you can justify using an array, or the more flexible
// ArrayList. Don't go crazy with it, though. You need it rarely if at all.
import java.util.ArrayList;

public class Assignment2 {

    // A connection to the database
    Connection connection;

    Assignment2() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * Connects to the database and sets the search path.
     * 
     * Establishes a connection to be used for this session, assigning it to the
     * instance variable 'connection'. In addition, sets the search path to
     * markus.
     * 
     * @param url
     *            the url for the database
     * @param username
     *            the username to be used to connect to the database
     * @param password
     *            the password to be used to connect to the database
     * @return true if connecting is successful, false otherwise
     */
    public boolean connectDB(String URL, String username, String password) {
        // Replace this return statement with an implementation of this method!
        try{
            connection = DriverManager.getConnection(URL, username, password);
            if (connection != null){
                try {
                    String queryString = "SET search_path TO markus";
                    PreparedStatement ps = connection.prepareStatement(queryString);
                    ps.execute();
                    return true;
                } catch (SQLException se){
                    System.err.println("SQL Exception. <Message>: " + se.getMessage());
                    return false;
                }
            }
            return false;
        } catch (SQLException se){
            System.err.println("SQL Exception. <Message>: " + se.getMessage());
            return false;
        }
    }

    /**
     * Closes the database connection.
     * 
     * @return true if the closing was successful, false otherwise
     */
    public boolean disconnectDB() {
        // Replace this return statement with an implementation of this method!
        try {
            connection.close();
            return connection.isClosed();
        } catch (SQLException se){
            System.err.println("SQL Exception. <Message>: " + se.getMessage());
            return false;
        }
    }

    /**
     * Assigns a grader for a group for an assignment.
     * 
     * Returns false if the groupID does not exist in the AssignmentGroup table,
     * if some grader has already been assigned to the group, or if grader is
     * not either a TA or instructor.
     * 
     * @param groupID
     *            id of the group
     * @param grader
     *            username of the grader
     * @return true if the operation was successful, false otherwise
     */
    public boolean assignGrader(int groupID, String grader) {
        // Replace this return statement with an implementation of this method!
        try{
            String queryString = "SELECT DISTINCT group_id FROM AssignmentGroup";
            PreparedStatement ps1 = connection.prepareStatement(queryString);
            ResultSet rs = ps1.executeQuery();
            boolean bool1 = false;
            while (rs.next()) {
                int group_id = rs.getInt("group_id");
                if (group_id == groupID){
                    bool1 = true;
                    break;
                }
            }

            queryString = "SELECT DISTINCT group_id FROM Grader";
            PreparedStatement ps2 = connection.prepareStatement(queryString);
            rs = ps2.executeQuery();
            boolean bool2 = true;
            while (rs.next()) {
                int group_id = rs.getInt("group_id");
                if (group_id == groupID){
                    bool2 = false;
                    break;
                }
            }

            queryString = "SELECT DISTINCT username FROM MarkusUser WHERE type = 'TA' OR type = 'instructor'";
            PreparedStatement ps3 = connection.prepareStatement(queryString);
            rs = ps3.executeQuery();
            boolean bool3 = false;
            while (rs.next()) {
                String username = rs.getString("username");
                if (username.equals(grader)){
                    bool3 = true;
                    break;
                }
            }

            if(!(bool1 && bool2 && bool3)){
                return false;
            }
            else{
                queryString = "INSERT INTO Grader VALUES (?, ?)";
                PreparedStatement ps4 = connection.prepareStatement(queryString);
                ps4.setInt(1, groupID);
                ps4.setString(2, grader);
                ps4.executeUpdate();
                return true;
            }
        } catch (SQLException se){
            System.err.println("SQL Exception. <Message>: " + se.getMessage());
            return false;
        }
    }

    /**
     * Adds a member to a group for an assignment.
     * 
     * Records the fact that a new member is part of a group for an assignment.
     * Does nothing (but returns true) if the member is already declared to be
     * in the group.
     * 
     * Does nothing and returns false if any of these conditions hold: - the
     * group is already at capacity, - newMember is not a valid username or is
     * not a student, - there is no assignment with this assignment ID, or - the
     * group ID has not been declared for the assignment.
     * 
     * @param assignmentID
     *            id of the assignment
     * @param groupID
     *            id of the group to receive a new member
     * @param newMember
     *            username of the new member to be added to the group
     * @return true if the operation was successful, false otherwise
     */
    public boolean recordMember(int assignmentID, int groupID, String newMember) {
        // First check if person already in the group
        try {
            String queryString1 = "SELECT * FROM Membership";
            PreparedStatement ps1 = connection.prepareStatement(queryString1);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()) {
                String username = rs1.getString("username");
                int group_id = rs1.getInt("group_id");
                if(username.equals(newMember) && group_id == groupID)
                    return true; // member already exists
            }
         // next check if group is at capacity
            String queryString2 = "SELECT group_id FROM (SELECT group_id, count(username) numberInGroup FROM Membership GROUP BY group_id) M1 " +
                                 "NATURAL JOIN AssignmentGroup NATURAL JOIN Assignment " +
                                 "WHERE numberInGroup = group_max"; // groups already at maximum capacity
            PreparedStatement ps2 = connection.prepareStatement(queryString2);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()) {
                int group_id = rs2.getInt("group_id");
                if(group_id == groupID)
                    return false; // condition falied
            }
         // next check if newMember is a valid username or if it is a student 
            String queryString3 = "SELECT username, type FROM MarkusUser WHERE type = 'student'";
            PreparedStatement ps3 = connection.prepareStatement(queryString3);
            ResultSet rs3 = ps3.executeQuery();
            boolean validMember = false;
            while(rs3.next()) {
                String username = rs3.getString("username");
                if(username.equals(newMember))
                    validMember = true;
            }
            // if valid member is false, then no valid member was found
            if(!validMember)
                return false;
         // next check if there is an assignment with this assignment id
            String queryString4 = "SELECT assignment_id FROM Assignment";
            PreparedStatement ps4 = connection.prepareStatement(queryString4);
            ResultSet rs4 = ps4.executeQuery();
            boolean validAssignment = false;
            while(rs4.next()) {
                int assignment_id = rs4.getInt("assignment_id");
                if(assignment_id == assignmentID)
                    validAssignment = true;
            }
            // if not found, assignmentID given is not valid
            if(!validAssignment)
                return false;
         // finally check if group id has been declared for the assignment
            String queryString5 = "SELECT group_id FROM Assignment NATURAL JOIN AssignmentGroup"; // group ids that have been declared in assignment
            PreparedStatement ps5 = connection.prepareStatement(queryString5);
            ResultSet rs5 = ps5.executeQuery();
            boolean validGroup = false;
            while(rs5.next()) {
                int group_id = rs5.getInt("group_id");
                if(groupID == group_id)
                    validGroup = true;
            }
            // if not found, group_id has not been assigned to assignment yet
            if(!validGroup)
                return false;
            // insert member into table
            String queryString6 = "INSERT INTO Membership VALUES (?, ?)";
            PreparedStatement ps6 = connection.prepareStatement(queryString6);
            ps6.setString(1, newMember);
            ps6.setInt(2, groupID);
            ps6.executeUpdate();
            return true;
        }
        catch (SQLException se){
            System.err.println("SQL Exception. <Message>: " + se.getMessage());
            return false;
        }
    }

    /**
     * Creates student groups for an assignment.
     * 
     * Finds all students who are defined in the Users table and puts each of
     * them into a group for the assignment. Suppose there are n. Each group
     * will be of the maximum size allowed for the assignment (call that k),
     * except for possibly one group of smaller size if n is not divisible by k.
     * Note that k may be as low as 1.
     * 
     * The choice of which students to put together is based on their grades on
     * another assignment, as recorded in table Results. Starting from the
     * highest grade on that other assignment, the top k students go into one
     * group, then the next k students go into the next, and so on. The last n %
     * k students form a smaller group.
     * 
     * In the extreme case that there are no students, does nothing and returns
     * true.
     * 
     * Students with no grade recorded for the other assignment come at the
     * bottom of the list, after students who received zero. When there is a tie
     * for grade (or non-grade) on the other assignment, takes students in order
     * by username, using alphabetical order from A to Z.
     * 
     * When a group is created, its group ID is generated automatically because
     * the group_id attribute of table AssignmentGroup is of type SERIAL. The
     * value of attribute repo is repoPrefix + "/group_" + group_id
     * 
     * Does nothing and returns false if there is no assignment with ID
     * assignmentToGroup or no assignment with ID otherAssignment, or if any
     * group has already been defined for this assignment.
     * 
     * @param assignmentToGroup
     *            the assignment ID of the assignment for which groups are to be
     *            created
     * @param otherAssignment
     *            the assignment ID of the other assignment on which the
     *            grouping is to be based
     * @param repoPrefix
     *            the prefix of the URL for the group's repository
     * @return true if successful and false otherwise
     */
    public boolean createGroups(int assignmentToGroup, int otherAssignment,
            String repoPrefix) {
        // Replace this return statement with an implementation of this method!
        try {
            String queryString1 = "SELECT count(*) numberofStudents FROM MarkusUser WHERE type = 'student'";
            PreparedStatement ps1 = connection.prepareStatement(queryString1);
            ResultSet rs1 = ps1.executeQuery();
            int n = 0;
            while(rs1.next())
                n = rs1.getInt("numberofStudents");
            if(n == 0)
                return true; // extreme case where no students in table
        // next check if assignmentToGroup and other assignment id are valid assignment id
            String queryString2 = "SELECT assignment_id FROM Assignment";
            PreparedStatement ps2 = connection.prepareStatement(queryString2);
            ResultSet rs2 = ps2.executeQuery();
            boolean validAssignmentToGroup = false;
            boolean validOtherAssignment = false;
            while(rs2.next()) {
                int assignment_id = rs2.getInt("assignment_id");
                if(assignmentToGroup == assignment_id)
                    validAssignmentToGroup = true;
                if(otherAssignment == assignment_id)
                    validOtherAssignment = true;
            }
            // assignment only valid if both assignment to group and other assignments ids are valid
            if(validAssignmentToGroup && validOtherAssignment){
                // do nothing
            }
            else {
                return false; // not valid
            }
        // next check if a group has already been defined for the assignment to group
            String queryString3 = "SELECT assignment_id FROM AssignmentGroup"; // assignments where a group has already been defined
            PreparedStatement ps3 = connection.prepareStatement(queryString3);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()) {
                int assignment_id = rs3.getInt("assignment_id");
                if(assignmentToGroup == assignment_id){
                    return false; // assignment already has group defined
                }
            }
        //  
            String queryString4 = "SELECT assignment_id, group_max FROM Assignment WHERE assignment_id = "+assignmentToGroup;
            PreparedStatement ps4 = connection.prepareStatement(queryString4);
            ResultSet rs4 = ps4.executeQuery();
            while(rs4.next()) {
                int assignment_id = rs4.getInt("assignment_id");
                int k = rs4.getInt("group_max");
                if(assignment_id == assignmentToGroup) {
                    // calculate number of groups with max capacity
                    int numberOfFullGroups = n / k;
                    // calculate remainder group size
                    int groupRemainder = n % k;
                    // create all the groups
                    // determine if extra group is needed                      
                    int j = 0;
                    if(groupRemainder != 0)
                        j = 1;

                    // find current max group and set the serial type.
                    String queryString5 = "SELECT MAX(group_id) currentMax FROM AssignmentGroup";
                    PreparedStatement ps5 = connection.prepareStatement(queryString5);
                    ResultSet rs5 = ps5.executeQuery();
                    int maxgroupNumber = 0;
                    while(rs5.next()) {
                        maxgroupNumber = rs5.getInt("currentMax");
                    }
                    String queryString6 = "SELECT setval('AssignmentGroup_group_id_seq', "+maxgroupNumber+")";
                    PreparedStatement ps6 = connection.prepareStatement(queryString6);
                    ps6.executeQuery(); // if not working change to execute query
                    // insert values into AssignmentGroup Table
                    for(int i = 0; i < numberOfFullGroups + j; ++i){
                        String queryString7 = "INSERT INTO AssignmentGroup VALUES (?, ?, ?)";
                        PreparedStatement ps7 = connection.prepareStatement(queryString7);
                        // set values for insert
                        ps7.setInt(1, maxgroupNumber + i + 1);
                        ps7.setInt(2, assignmentToGroup);
                        String maxGroupNum = Integer.toString(maxgroupNumber + i + 1); // plus one to take into account increment for current group
                        ps7.setString(3, repoPrefix + "/group_" + maxGroupNum);
                        ps7.executeUpdate();
                    }
                    // now we can insert values into Membership table
                    // first deal with full groups

                    // the following query orders students in the other assignment based on their marks
                    String queryString8 = "SELECT username FROM (SELECT * FROM  Membership NATURAL JOIN Result NATURAL JOIN AssignmentGroup NATURAL JOIN MarkusUser "+
                                          "WHERE type = 'student' AND assignment_id = "+otherAssignment+") A NATURAL RIGHT JOIN MarkusUser WHERE type = 'student' ORDER BY mark DESC, username ASC";
                    PreparedStatement ps8 = connection.prepareStatement(queryString8);
                    ResultSet rs8 = ps8.executeQuery();
                    ArrayList<String> arr = new ArrayList<String>();
                    while(rs8.next()){
                        String username = rs8.getString("username");
                        arr.add(username);
                    }
                    int groupIDInserted = maxgroupNumber + 1;
                    int a = 0;
                    for(int x = 0; x < numberOfFullGroups; ++x){
                        for(int y = 0; y < k; ++y) {
                            String queryString9 = "INSERT INTO Membership VALUES (?, ?)";
                            PreparedStatement ps9 = connection.prepareStatement(queryString9);
                            ps9.setInt(2, groupIDInserted);
                            ps9.setString(1, arr.get(a));
                            ps9.executeUpdate();
                            a++;
                        }
                        groupIDInserted++;
                    }
                    // deal with possible extra group
                    if(groupRemainder != 0){
                        for(int z = 0; z < groupRemainder; ++z){
                            String queryString10 = "INSERT INTO Membership VALUES (?, ?)";
                            PreparedStatement ps10 = connection.prepareStatement(queryString10);
                            ps10.setInt(2, groupIDInserted);
                            ps10.setString(1, arr.get(a));
                            ps10.executeUpdate();
                            a++;
                        }
                    }
                }
            }
            return true;
        }
        catch (SQLException se){
            System.err.println("SQL Exception. <Message>: " + se.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        // You can put testing code in here. It will not affect our autotester.
        String url = "jdbc:postgresql://localhost:5432/csc343h-yangda10";
        String username = "yangda10";
        String password = "";

        try{
            Assignment2 a2 = new Assignment2();

            a2.connectDB(url, username, password);
            boolean create_Groups = a2.createGroups(2000, 1000, "repo");
            System.out.println(create_Groups);
            a2.disconnectDB();

            System.out.println("Boo!");

        } catch (SQLException se){
            System.err.println("SQL Exception. <Message>: " + se.getMessage());
            return;
        }
    }
}