current_branch = 'latest'
build:
	docker build -t hadoop/base:$(current_branch) ./hadoop/base
	docker build -t hadoop/namenode:$(current_branch) ./hadoop/namenode
	docker build -t hadoop/datanode:$(current_branch) ./hadoop/datanode
	docker build -t hive:$(current_branch) ./hive
	docker build -t prestodb:$(current_branch) ./prestodb
	docker build -t crawler:$(current_branch) ./crawler	
install:
	docker-compose up -d mysql
	docker run hive:$(current_branch) /opt/hive/bin/schematool -dbType mysql -initSchema
