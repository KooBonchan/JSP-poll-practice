const form = document.formNewPoll;

const addMoreChoice = document.getElementById("add-more-choice");
const choiceForm = '<li><input type="text" name="item"></li>'

const submitButton = document.getElementById("submit-button");

function validate(){
	const items = Array.from(form.items)
					.map(input => input.value)
					.filter(input => input.length > 0);
	console.log(items);
	if(form.question.value.length == 0){
		return false;
	}
	if(items.length == 0){
		return false;
	}
	
	if(form.start_date.value > form.end_date.value){
		return false;
	}

	return true;
}

addMoreChoice.addEventListener("click",function(e) {
	addMoreChoice.parentNode
	.insertAdjacentHTML("beforebegin", choiceForm);
});

submitButton.addEventListener("click",function(e){
	e.preventDefault();
	if(validate()){
		form.submit();
		return;
	}else {
		alert("Fill the poll correctly");
	}
})