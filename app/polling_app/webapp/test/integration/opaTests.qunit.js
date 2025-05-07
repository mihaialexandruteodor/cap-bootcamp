sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'vote/pollingapp/test/integration/FirstJourney',
		'vote/pollingapp/test/integration/pages/NationWideResultsList',
		'vote/pollingapp/test/integration/pages/NationWideResultsObjectPage'
    ],
    function(JourneyRunner, opaJourney, NationWideResultsList, NationWideResultsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('vote/pollingapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheNationWideResultsList: NationWideResultsList,
					onTheNationWideResultsObjectPage: NationWideResultsObjectPage
                }
            },
            opaJourney.run
        );
    }
);