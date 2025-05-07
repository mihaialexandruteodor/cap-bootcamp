using AnalyticService as service from '../../srv/cat-service';
annotate service.Resulsts with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : age,
            Label : 'age',
        },
        {
            $Type : 'UI.DataField',
            Value : firstName,
            Label : 'firstName',
        },
        {
            $Type : 'UI.DataField',
            Value : gender,
            Label : 'gender',
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            Label : 'lastName',
        },
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
    ]
);

