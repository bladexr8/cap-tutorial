using RiskService from './risk-service';

annotate RiskService.Risks with {
	title       @title: 'Title';
	prio        @title: 'Priority';
	descr       @title: 'Description';
	miti        @title: 'Mitigation';
	impact      @title: 'Impact';
}

annotate RiskService.Mitigations with {
	ID @(
		UI.Hidden,
		Common: {
		Text: description
		}
	);
	description  @title: 'Description';
	owner        @title: 'Owner';
	timeline     @title: 'Timeline';
	risks        @title: 'Risks';
}

annotate RiskService.Contacts with {
	AccountName		@title: 'Account Name';
	Salutation    	@title: 'Salutation';
    FirstName     	@title: 'First Name';
    LastName      	@title:	'Last Name';
    Title         	@title: 'Title';
    Department    	@title: 'Department';
    Birthdate     	@title: 'Birthdate';
    Phone         	@title: 'Phone';
    MobilePhone   	@title: 'Mobile Phone';
    Email         	@title: 'Email';
}

annotate RiskService.Risks with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Risk',
			TypeNamePlural: 'Risks',
			Title          : {
                $Type : 'UI.DataField',
                Value : title
            },
			Description : {
				$Type: 'UI.DataField',
				Value: descr
			}
		},
		SelectionFields: [prio],
		LineItem: [
			{Value: title},
			{
				Value: miti_ID,
				![@HTML5.CssDefaults] : {width : '100%'}
			},
			{
				Value: prio,
				Criticality: criticality
			},
			{
				Value: impact,
				Criticality: criticality
			}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Value: miti_ID},
				{
					Value: prio,
					Criticality: criticality
				},
				{
					Value: impact,
					Criticality: criticality
				}
			]
		}
	},
) {

};

annotate RiskService.Risks with {
	miti @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: miti.description  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Mitigations',
				CollectionPath: 'Mitigations',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: miti_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'description'
					}
				]
			}
		}
	);
}

annotate RiskService.Contacts with @(
	UI: {
		HeaderInfo  : {
			$Type : 'UI.HeaderInfoType',
			TypeName : 'Contact',
			TypeNamePlural : 'Contacts',
			Title: {
				$Type: 'UI.DataField',
				Value: AccountName
			},
			Description: {
				$Type: 'UI.DataField',
				Value: Title
			}
		},
		SelectionFields  : [
			AccountName
		],
		LineItem  : [
			{Value: AccountName},
			{Value: Salutation},
			{Value: FirstName},
			{Value: LastName},
			{Value: Title},
			{
				Value: Email,
				![@HTML5.CssDefaults] : {width : '100%'}
			}
		],
		Facets  : [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main  : {
			$Type : 'UI.FieldGroupType',
			Data: [
				{Value: Salutation},
				{Value: FirstName},
				{Value: LastName}
			]
			
		},
	}
) {

};
