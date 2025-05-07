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
);

