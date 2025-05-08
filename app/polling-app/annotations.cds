using AnalyticService as service from '../../srv/cat-service';
annotate service.Resulsts with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : votedCanditade_ID,
            Label : 'votedCanditade_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : votingSection_ID,
            Label : 'votingSection_ID',
        },
    ],
    Analytics.AggregatedProperty #ID_countdistinct : {
        $Type : 'Analytics.AggregatedPropertyType',
        Name : 'ID_countdistinct',
        AggregatableProperty : ID,
        AggregationMethod : 'countdistinct',
        ![@Common.Label] : 'ID (Count Distinct Values)',
    },
    UI.Chart #alpChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Pie,
        Dimensions : [
            votedCanditade_ID,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.SelectionFields : [
        votedCanditade_ID,
    ],
);

annotate service.Resulsts with {
    votingSection @Common.Label : 'votingSection_ID'
};

annotate service.Candidates with {
    party @Common.Label : '{i18n>PoliticalParty}'
};

annotate service.Candidates with {
    gender @Common.Label : 'Candidate ge'
};

annotate service.Candidates with {
    firstName @Common.Label : '{i18n>CandidateFirstName}'
};

annotate service.Sections with {
    region @Common.Label : '{i18n>VotingRegion}'
};

annotate service.Resulsts with {
    gender @Common.Label : '{i18n>VotersGender}'
};

annotate service.Resulsts with {
    votedCanditade @(
        Common.Label : 'votedCanditade_ID',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Candidates',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : votedCanditade_ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'Name',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Candidates with {
    ID @Common.Text : {
        $value : firstName,
        ![@UI.TextArrangement] : #TextFirst,
    }
};

