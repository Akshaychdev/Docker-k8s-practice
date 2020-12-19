// Selectors

const container = document.querySelector('.container');
const containerEdit = document.querySelector('.container--edit');
// attributes
const name = document.getElementById('name');
const email = document.getElementById('email');
const interests = document.getElementById('interests');
// Inputs
const nameInput = document.getElementById('input-name');
const emailInput = document.getElementById('input-email');
const interestInput = document.getElementById('input-interest');

// To edit profile
const editProfile = () => {
  // show edit box
  container.style.display = 'none';
  containerEdit.style.display = 'block';

  // put the existing values to the inputs to edit
  nameInput.value = name.textContent;
  emailInput.value = email.textContent;
  interestInput.value = interests.textContent;
}

// Change attributes and save the profile
const saveProfile = () => {
  // change the attributes with the new input
  name.textContent = nameInput.value;
  email.textContent = emailInput.value;
  interests.textContent = interestInput.value;

  // show main hide edit box
  container.style.display = 'block';
  containerEdit.style.display = 'none';
}