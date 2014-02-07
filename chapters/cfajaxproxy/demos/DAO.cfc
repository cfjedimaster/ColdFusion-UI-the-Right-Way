// DAO.cfc
component {

	remote struct function getData() returnformat="json" {
		return {
			"labels"	= ["Mon","Tue","Wed","Thu","Fri"],
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
}