# AlertPackage

SwiftUI Alert Message Show

step 1.

	add 

	@State private var alertModifier: AlertModifier = .init() // 提示訊息

step 2.

	operate View add

	.modifier(alertModifier)

step 3.

	show action add

	alertModifier.show(title:, message: , buttons: [AlertModifier.ButtonInfo])

		title is alert title
		message is alert message
		buttons is alert button item
		
	AlertModifier.ButtonInfo
		title is alert button title
		role is alert button ButtonRole
		action is alert button select event action 
