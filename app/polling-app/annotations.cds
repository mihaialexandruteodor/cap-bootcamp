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
        DimensionAttributes : [
            {
                Dimension : votedCanditade_ID,
            },
        ],
    },
    UI.SelectionFields : [
        votedCanditade_ID,
        votingSection_ID,
        votedCanditadeParty,
        voteSectionName,
    ],
    UI.Chart #visualFilter : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            votedCanditade_ID,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter',
        ],
    },
    UI.Chart #visualFilter1 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            votingSection_ID,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter1 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter1',
        ],
    },
    UI.Chart #visualFilter2 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            votedCanditadeParty,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter2 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter2',
        ],
    },
    UI.Chart #visualFilter3 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            votedCanditadeParty,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter3 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter3',
        ],
    },
    UI.Chart #visualFilter4 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            voteSectionName,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter4 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter4',
        ],
    },
    UI.Chart #visualFilter5 : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Dimensions : [
            voteSectionName,
        ],
        DynamicMeasures : [
            '@Analytics.AggregatedProperty#ID_countdistinct',
        ],
    },
    UI.PresentationVariant #visualFilter5 : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.Chart#visualFilter5',
        ],
    },
);

annotate service.Resulsts with {
    votingSection @(
        Common.Label : '{i18n>SectionRegion}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Sections',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : votingSection_ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'region',
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.Candidates with {
    party @(
        Common.Label : '{i18n>PoliticalParty}',
        Common.Text : {
            $value : firstName,
            ![@UI.TextArrangement] : #TextOnly,
        },
    )
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
        Common.Label : '{i18n>CandidateName}',
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
        Common.Text : {
            $value : votedCanditadeFirstName,
            ![@UI.TextArrangement] : #TextOnly
        },
        )
};

annotate service.Candidates with {
    ID @Common.Text : {
        $value : firstName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Sections with {
    ID @Common.Text : {
        $value : region,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Resulsts with {
    votedCanditadeParty @(Common.Label : '{i18n>Party}',
        Common.ValueList #visualFilter : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Resulsts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : votedCanditadeParty,
                    ValueListProperty : 'votedCanditadeParty',
                },
            ],
            PresentationVariantQualifier : 'visualFilter3',
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Resulsts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : votedCanditadeParty,
                    ValueListProperty : 'votedCanditadeParty',
                },
            ],
            Label : 'Party',
        },
        Common.ValueListWithFixedValues : true,
        )};

annotate service.Resulsts with {
    voteSectionName @(Common.Label : '{i18n>Section}',
        Common.ValueList #visualFilter : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Resulsts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : voteSectionName,
                    ValueListProperty : 'voteSectionName',
                },
            ],
            PresentationVariantQualifier : 'visualFilter5',
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Resulsts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : voteSectionName,
                    ValueListProperty : 'voteSectionName',
                },
            ],
            Label : 'Section',
        },
        Common.ValueListWithFixedValues : true,
        )};

annotate service.Resulsts with {
    firstName @Common.Text : {
        $value : votedCanditadeParty,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Sections with {
    name @Common.Text : region
};

