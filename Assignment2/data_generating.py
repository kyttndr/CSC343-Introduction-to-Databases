for i in range(2021, 2030):
	#print "INSERT INTO MarkusUser VALUES ('s%d', 'sln%d', 'sfn%d', 'student');" %(i, i, i)
	#print "INSERT INTO AssignmentGroup VALUES (%d, 2000, 'repo_url');" %(2033 + i)
	#print "INSERT INTO Membership VALUES ('s%d', %d);" %(i, 1992 + i)
	#print "INSERT INTO Grader VALUES (%d, 't2');" %(i)
	#print "INSERT INTO Result VALUES (%d, 18, true);" %(i)
	print "INSERT INTO Grade VALUES (%d, 4004, 8);" %(i)
	print "INSERT INTO Grade VALUES (%d, 4005, 10);" %(i)

#scp ~/Desktop/Assignment3/q1.xp sunpeiy1@dbsrv1.teach.cs.toronto.edu:~/Desktop/a3
#ssh sunpeiy1@dbsrv1.teach.cs.toronto.edu
#AdamNFong