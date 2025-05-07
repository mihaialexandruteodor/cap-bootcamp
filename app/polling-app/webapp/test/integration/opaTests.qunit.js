sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'vote/pollingapp/test/integration/FirstJourney',
		'vote/pollingapp/test/integration/pages/ResulstsList',
		'vote/pollingapp/test/integration/pages/ResulstsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ResulstsList, ResulstsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('vote/pollingapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheResulstsList: ResulstsList,
					onTheResulstsObjectPage: ResulstsObjectPage
                }
            },
            opaJourney.run
        );
    }
);