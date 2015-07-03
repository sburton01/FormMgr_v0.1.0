<cfset nounForms = CreateObject("component", "nounForms").init() />

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="ColdFusion Singularization/Pluralization Example.">
	
    <title>ColdFusion Singularization/Pluralization Example</title>
	<link href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css" rel="stylesheet" />
</head>

<body>
	<div class="pure-g">
		<div class="pure-u-1-1">
			<form action="index.cfm" method="post" class="pure-form pure-form-aligned">
			<fieldset>
					<legend style="font-weight:bold; font-size:18pt; margin:50px; 50px; 0 50px;">Singularize/Pluralize Words</legend>

					<div class="pure-control-group">
						<label>Word</label>
						<input name="word" type="text" size="50" maxlength="50" placeholder="Enter a word" <cfif structKeyExists(form,'word')>value="<cfoutput>#form.word#</cfoutput>"</cfif>/>
					</div>

					<div class="pure-control-group">
						<label> </label>
						<input name="btnSingularize" type="submit" value="Make Singular" SubmitOnce="true" class="pure-button pure-button-primary" />
						<input name="btnPluralize" type="submit" value="Make Plural" SubmitOnce="true" class="pure-button pure-button-primary" />
					</div>
					
					<div class="pure-control-group" style="margin-top:50px;">
						<label> </label>
							
						<cfif structKeyExists(form, 'btnSingularize')>
							<cfset newForm = nounForms.singularize(form.word)>
							<cfoutput><input type="text" size="50" readonly="readOnly" value='The single form of "#form.word#" is "#newForm#"'</input></cfoutput>
						<cfelseif structKeyExists(form, 'btnPluralize')>
							<cfset newForm = nounForms.pluralize(form.word)>
							<cfoutput><input type="text" size="50" readonly="readOnly" value='The plural form of "#form.word#" is "#newForm#"'</input></cfoutput>
						</cfif>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>