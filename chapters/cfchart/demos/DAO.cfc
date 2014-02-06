// DAO.cfc
component {

	remote struct function getDataForJSVersion() returnformat="json" {
		return {
			"labels"	= "Mon,Tue,Wed,Thu,Fri",
			"records"	= [
				{
					"text"	="Apples",
					"values"=[1,2,4,8,4]
				},{
					"text"	="Bananas",
					"values"=[10,8,6,4,6]
				},{
					"text"	="Cherries",
					"values"=[1,3,9,3,1]
				}
			]
		};
	}

	public query function getDataForCfmlVersion(){
		return queryNew(
			"id,day,item,total",
			"integer,varchar,varchar,integer", [
				[1, "Mon", "Apples", 1],
				[4, "Tue", "Apples", 2],
				[7, "Wed", "Apples", 4],
				[10, "Thu", "Apples", 8],
				[13, "Fri", "Apples", 4],
				[2, "Mon", "Bananas", 10],
				[5, "Tue", "Bananas", 8],
				[8, "Wed", "Bananas", 6],
				[11, "Thu", "Bananas", 4],
				[14, "Fri", "Bananas", 6],
				[3, "Mon", "Cherries", 1],
				[6, "Tue", "Cherries", 3],
				[9, "Wed", "Cherries", 9],
				[12, "Thu", "Cherries", 3],
				[15, "Fri", "Cherries", 1]
			]
		);
	}
}