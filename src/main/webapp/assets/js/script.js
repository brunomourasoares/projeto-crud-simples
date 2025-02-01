document.addEventListener('DOMContentLoaded', () => {
    createUserFormHandler();
});

// Create User
const createUserFormHandler = () => {
    const createForm = document.getElementById('create_form');

    if (createForm) {
        const createName = document.getElementById('name_input');
        const createEmail = document.getElementById('email_input');
        const createPhone = document.getElementById('phone_input');
        const createBirthdate = document.getElementById('birthdate_input');
        const createAddress = document.getElementById('address_input');
        const createButton = document.getElementById('submit_button');

        createForm.addEventListener('submit', (event) => {
            event.preventDefault();
            setLoadingButton(createButton);
            setTimeout(() => {
                const errors = [
                    {
                        condition: validateEmptyFields(createName),
                        message: 'Preencha o nome!',
                        icon: 'name_icon',
                        input: 'name_input',
                        error: 'name_error'
                    },
                    {
                        condition: validateEmptyFields(createEmail),
                        message: 'Preencha o e-mail!',
                        icon: 'email_icon',
                        input: 'email_input',
                        error: 'email_error'
                    },
                    {
                        condition: validateEmptyFields(createPhone),
                        message: 'Preencha o telefone!',
                        icon: 'phone_icon',
                        input: 'phone_input',
                        error: 'phone_error'
                    },
                    {
                        condition: validateEmptyFields(createBirthdate),
                        message: 'Preencha a data de nascimento!',
                        icon: 'birthdate_icon',
                        input: 'birthdate_input',
                        error: 'birthdate_error'
                    },
                    {
                        condition: validateEmptyFields(createAddress),
                        message: 'Preencha o endereço!',
                        icon: 'address_icon',
                        input: 'address_input',
                        error: 'address_error'
                    },
                    {
                        condition: validateWhitespace(createEmail),
                        message: 'E-mail não pode conter espaços!',
                        icon: 'email_icon',
                        input: 'email_input',
                        error: 'email_error'
                    },
                    {
                        condition: validateWhitespace(createPhone),
                        message: 'Telefone não pode conter espaços!',
                        icon: 'phone_icon',
                        input: 'phone_input',
                        error: 'phone_error'
                    },
                    {
                        condition: !validateEmail(createEmail.value),
                        message: 'Insira um e-mail válido!',
                        icon: 'email_icon',
                        input: 'email_input',
                        error: 'email_error'
                    },
                    {
                        condition: validatePhone(createPhone.value),
                        message: 'Telefone deve ter 10 ou 11 dígitos!',
                        icon: 'phone_icon',
                        input: 'phone_input',
                        error: 'phone_error'
                    }
                ];

                for (const {condition, message, icon, input, error} of errors) {
                    if (condition) {
                        showError(icon, input, error, message);
                        removeLoadingButton(createButton);
                        return;
                    } else {
                        hideError(icon, input, error);
                    }
                }

                createForm.submit();
            }, 700);
        });
    }
};

const setLoadingButton = (button) => {
    if (button) {
        button.classList.add('is-loading');
    }
}

const removeLoadingButton = (button) => {
    if (button) {
        button.classList.remove('is-loading');
    }
}

const validateEmptyFields = (field) => {
    return field.value.trim() === '';
}

const validateWhitespace = (field) => {
    return /\s/.test(field.value);
}

const validateEmail = (email) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

const validatePhone = (phone) => {
    const phoneRegex = /^(?:\d{2}9\d{8}|\d{2}\d{8})$/;
    return phoneRegex.test(phone.value);
}

const showError = (iconId, inputId, errorId, message) => {
    const icon = document.getElementById(iconId);
    const input = document.getElementById(inputId);
    const error = document.getElementById(errorId);

    if (icon) {
        icon.classList.remove('is-hidden');
    }
    if (input) {
        input.classList.add('is-danger');
    }
    if (error) {
        error.innerHTML = message;
    }
}

const hideError = (iconId, inputId, errorId) => {
    const icon = document.getElementById(iconId);
    const input = document.getElementById(inputId);
    const error = document.getElementById(errorId);

    if (icon) {
        icon.classList.add('is-hidden');
    }
    if (input) {
        input.classList.remove('is-danger');
    }
    if (error) {
        error.innerHTML = '&nbsp;';
    }
}
