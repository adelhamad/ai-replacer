function run(input, parameters) {

    var app = Application.currentApplication();
    app.includeStandardAdditions = true;
    app.displayNotification('AI Assistent', { withTitle: 'AI responded' });

    var resultString = input[0]; 
    
	var jsonResult = JSON.parse(resultString)
    
    // Return something or perform further actions
    return jsonResult.choices[0].message.content; // This example simply passes the string along
}
