document.addEventListener('DOMContentLoaded', () => {
    // ========== CONFIGURATION EMAIL ==========
    // 🔴 REMPLACEZ "xyzabcde" PAR VOTRE ID FORMSPREE
    const FORMSPREE_ID = "mykyerpd";
    
    // ========== BOUTON DE CHANGEMENT DE LANGUE ==========
    const langButton = document.createElement('button');
    langButton.id = 'langToggle';
    langButton.innerHTML = '🌐 FR';
    langButton.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 1000;
        background: #4CAF50;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        
        font-size: 14px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
    `;
    document.body.appendChild(langButton);

    // Dictionnaires de traduction
    const translations = {
        fr: {
            title: "Formulaire de Réservation",
            nom: "Nom complet *",
            telephone: "Numéro de téléphone",
            email: "Adresse email *",
            enfants: "Avez-vous des enfants ?",
            oui: "Oui",
            non: "Non",
            nombreEnfants: "Nombre d'enfants",
            commentaires: "Commentaires supplémentaires",
            submit: "Envoyer ma demande",
            sending: "Envoi en cours...",
            
            commentTitle: "Commentaires des Clients",
            commentPlaceholder: "Votre commentaire...",
            commentNomPlaceholder: "Votre nom (optionnel)",
            commentSubmit: "Publier",
            
            successTitle: "Demande envoyée !",
            successMessage: "Nous vous contacterons sous 24h.",
            commentSuccess: "Merci !",
            commentSuccessMessage: "Votre commentaire a été publié.",
            errorMessage: "Veuillez remplir tous les champs obligatoires.",
            sendError: "Erreur d'envoi. Veuillez réessayer.",
            
            nomError: "Le nom doit contenir au moins 2 caractères",
            emailError: "Email invalide"
        },
        en: {
            title: "Booking Form",
            nom: "Full name *",
            telephone: "Phone number",
            email: "Email address *",
            enfants: "Do you have children?",
            oui: "Yes",
            non: "No",
            nombreEnfants: "Number of children",
            commentaires: "Additional comments",
            submit: "Submit my request",
            sending: "Sending...",
            
            commentTitle: "Customer Reviews",
            commentPlaceholder: "Your comment...",
            commentNomPlaceholder: "Your name (optional)",
            commentSubmit: "Publish",
            
            successTitle: "Request sent!",
            successMessage: "We will contact you within 24 hours.",
            commentSuccess: "Thank you!",
            commentSuccessMessage: "Your comment has been published.",
            errorMessage: "Please fill all required fields.",
            sendError: "Sending error. Please try again.",
            
            nomError: "Name must be at least 2 characters",
            emailError: "Invalid email"
        },
        ar: {
            title: "نموذج الحجز",
            nom: "الاسم الكامل *",
            telephone: "رقم الهاتف",
            email: "البريد الإلكتروني *",
            enfants: "هل لديك أطفال؟",
            oui: "نعم",
            non: "لا",
            nombreEnfants: "عدد الأطفال",
            commentaires: "تعليقات إضافية",
            submit: "إرسال طلبي",
            sending: "جاري الإرسال...",
            
            commentTitle: "تعليقات العملاء",
            commentPlaceholder: "تعليقك...",
            commentNomPlaceholder: "اسمك (اختياري)",
            commentSubmit: "نشر",
            
            successTitle: "تم إرسال الطلب!",
            successMessage: "سنتصل بك خلال 24 ساعة.",
            commentSuccess: "شكراً!",
            commentSuccessMessage: "تم نشر تعليقك.",
            errorMessage: "يرجى ملء جميع الحقول المطلوبة.",
            sendError: "خطأ في الإرسال. حاول مرة أخرى.",
            
            nomError: "يجب أن يكون الاسم على الأقل حرفين",
            emailError: "بريد إلكتروني غير صالح"
        }
    };

    const langOrder = ['fr', 'en', 'ar'];
    let currentLangIndex = 0;

    function changeLanguage(lang) {
        const t = translations[lang];
        
        langButton.innerHTML = `🌐 ${lang.toUpperCase()}`;
        
        const mainTitle = document.querySelector('h2');
        if (mainTitle) mainTitle.textContent = t.title;
        
        const labels = {
            'nom': t.nom,
            'telephone': t.telephone,
            'email': t.email,
            'enfants': t.enfants,
            'enfant-oui': t.oui,
            'enfant-non': t.non,
            'nombreEnfantsInput': t.nombreEnfants,
            'commentaire': t.commentaires
        };
        
        Object.keys(labels).forEach(id => {
            const label = document.querySelector(`label[for="${id}"]`);
            if (label) label.textContent = labels[id];
        });
        
        document.getElementById('nom').placeholder = t.nom;
        document.getElementById('telephone').placeholder = t.telephone;
        document.getElementById('email').placeholder = t.email;
        const nombreEnfantsInput = document.getElementById('nombreEnfantsInput');
        if (nombreEnfantsInput) nombreEnfantsInput.placeholder = t.nombreEnfants;
        document.getElementById('commentaire').placeholder = t.commentaires;
        
        const submitBtn = document.getElementById('submitBtn');
        if (submitBtn && !submitBtn.disabled) submitBtn.textContent = t.submit;
        
        const commentTitle = document.querySelector('#commentSection h3');
        if (commentTitle) commentTitle.textContent = t.commentTitle;
        
        const commentNom = document.getElementById('commentNom');
        if (commentNom) commentNom.placeholder = t.commentNomPlaceholder;
        
        const commentText = document.getElementById('commentText');
        if (commentText) commentText.placeholder = t.commentPlaceholder;
        
        const commentSubmitBtn = document.querySelector('#commentForm button[type="submit"]');
        if (commentSubmitBtn) commentSubmitBtn.textContent = t.commentSubmit;
        
        const nomError = document.getElementById('nomError');
        if (nomError) nomError.textContent = t.nomError;
        
        const emailError = document.getElementById('emailError');
        if (emailError) emailError.textContent = t.emailError;
        
        if (lang === 'ar') {
            document.body.style.direction = 'rtl';
            document.body.style.textAlign = 'right';
            langButton.style.right = 'auto';
            langButton.style.left = '20px';
        } else {
            document.body.style.direction = 'ltr';
            document.body.style.textAlign = 'left';
            langButton.style.left = 'auto';
            langButton.style.right = '20px';
        }
        
        localStorage.setItem('preferredLanguage', lang);
    }

    function nextLanguage() {
        currentLangIndex = (currentLangIndex + 1) % langOrder.length;
        const nextLang = langOrder[currentLangIndex];
        changeLanguage(nextLang);
    }

    langButton.addEventListener('click', nextLanguage);

    const savedLang = localStorage.getItem('preferredLanguage');
    if (savedLang && translations[savedLang]) {
        const savedIndex = langOrder.indexOf(savedLang);
        if (savedIndex !== -1) {
            currentLangIndex = savedIndex;
            changeLanguage(savedLang);
        }
    } else {
        changeLanguage('fr');
    }

    // ========== GESTION DES ENFANTS ==========
    const enfantOui = document.getElementById('enfant-oui');
    const enfantNon = document.getElementById('enfant-non');
    const nombreEnfantsGroup = document.getElementById('nombreEnfants');

    const toggleEnfants = () => {
        if (nombreEnfantsGroup) {
            nombreEnfantsGroup.style.display = enfantOui && enfantOui.checked ? 'block' : 'none';
        }
    };

    if (enfantOui) enfantOui.addEventListener('change', toggleEnfants);
    if (enfantNon) enfantNon.addEventListener('change', toggleEnfants);

    // ========== SYSTÈME DE NOTIFICATION ==========
    const indicator = document.getElementById('confirmationIndicator');
    const closeBtn = document.getElementById('closeConfirmation');

    function showNotification(title, message, isError = false) {
        if (!indicator) return;
        
        const titleEl = document.getElementById('notificationTitle');
        const msgEl = document.getElementById('confirmationMessage');
        const icon = document.getElementById('notificationIcon');

        if (titleEl) titleEl.textContent = title;
        if (msgEl) msgEl.textContent = message;
        
        if (isError) {
            indicator.classList.add('error-notification');
            if (icon) icon.className = 'fas fa-exclamation-circle';
        } else {
            indicator.classList.remove('error-notification');
            if (icon) icon.className = 'fas fa-check-circle';
        }

        indicator.style.display = 'flex';
        setTimeout(() => { indicator.style.display = 'none'; }, 5000);
    }

    if (closeBtn) closeBtn.addEventListener('click', () => { 
        if (indicator) indicator.style.display = 'none'; 
    });

    // ========== SOUMISSION DU FORMULAIRE AVEC EMAIL ==========
    const bookingForm = document.getElementById('bookingForm');
    
    if (bookingForm) {
        bookingForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            let isValid = true;
            const t = translations[langOrder[currentLangIndex]];
            const submitBtn = document.getElementById('submitBtn');

            // Validation
            const nom = document.getElementById('nom');
            const email = document.getElementById('email');
            
            if (nom && nom.value.length < 2) {
                const nomError = document.getElementById('nomError');
                if (nomError) nomError.classList.add('show');
                nom.classList.add('error');
                isValid = false;
            } else if (nom) {
                const nomError = document.getElementById('nomError');
                if (nomError) nomError.classList.remove('show');
                nom.classList.remove('error');
            }

            if (email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email.value)) {
                    const emailError = document.getElementById('emailError');
                    if (emailError) emailError.classList.add('show');
                    email.classList.add('error');
                    isValid = false;
                } else {
                    const emailError = document.getElementById('emailError');
                    if (emailError) emailError.classList.remove('show');
                    email.classList.remove('error');
                }
            }

            if (isValid) {
                // Désactiver le bouton pendant l'envoi
                if (submitBtn) {
                    submitBtn.disabled = true;
                    submitBtn.textContent = t.sending;
                }

                // Préparer les données
                const telephone = document.getElementById('telephone');
                const commentaire = document.getElementById('commentaire');
                const nombreEnfantsInput = document.getElementById('nombreEnfantsInput');
                
                const formData = new FormData();
                formData.append('Nom', nom.value);
                formData.append('Email', email.value);
                formData.append('Téléphone', telephone ? telephone.value : 'Non renseigné');
                formData.append('Enfants', enfantOui && enfantOui.checked ? 'Oui' : 'Non');
                formData.append('Nombre d\'enfants', enfantOui && enfantOui.checked && nombreEnfantsInput ? nombreEnfantsInput.value : '0');
                formData.append('Commentaire', commentaire ? commentaire.value : 'Aucun');
                formData.append('Date de réservation', new Date().toLocaleString('fr-FR'));
                formData.append('_subject', `🔔 Nouvelle réservation de ${nom.value}`);

                try {
                    const response = await fetch(`https://formspree.io/f/${FORMSPREE_ID}`, {
                        method: 'POST',
                        body: formData,
                        headers: {
                            'Accept': 'application/json'
                        }
                    });

                    if (response.ok) {
                        showNotification(t.successTitle, t.successMessage);
                        bookingForm.reset();
                        toggleEnfants();
                    } else {
                        throw new Error('Erreur serveur');
                    }
                } catch (error) {
                    showNotification("Erreur", t.sendError, true);
                    console.error('Erreur:', error);
                } finally {
                    // Réactiver le bouton
                    if (submitBtn) {
                        submitBtn.disabled = false;
                        submitBtn.textContent = t.submit;
                    }
                }
            } else {
                showNotification("Erreur", t.errorMessage, true);
            }
        });
    }

    // ========== GESTION DES COMMENTAIRES ==========
    const commentForm = document.getElementById('commentForm');
    const commentsList = document.getElementById('commentsList');

    if (commentForm) {
        commentForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const t = translations[langOrder[currentLangIndex]];
            
            let nom = document.getElementById('commentNom').value;
            const texte = document.getElementById('commentText').value;

            if (texte.trim() === "") return;

            if (!nom || nom.trim() === "") {
                nom = currentLangIndex === 0 ? "Anonyme" : 
                      currentLangIndex === 1 ? "Anonymous" : "مجهول";
            }

            const dateOptions = {
                fr: { day: 'numeric', month: 'long', year: 'numeric' },
                en: { day: 'numeric', month: 'long', year: 'numeric' },
                ar: { day: 'numeric', month: 'long', year: 'numeric' }
            };
            
            const locale = langOrder[currentLangIndex] === 'ar' ? 'ar-SA' : 
                          langOrder[currentLangIndex] === 'en' ? 'en-US' : 'fr-FR';
            
            const date = new Date().toLocaleDateString(locale, dateOptions[langOrder[currentLangIndex]]);

            const newComment = document.createElement('div');
            newComment.className = 'commentaire';
            newComment.style.animation = 'fadeInUp 0.5s ease-out';
            
            if (langOrder[currentLangIndex] === 'ar') {
                newComment.style.textAlign = 'right';
                newComment.style.direction = 'rtl';
            }
            
            newComment.innerHTML = `
                <div class="commentaire-header">
                    <span><strong>${nom}</strong></span>
                    <span>${date}</span>
                </div>
                <p>"${texte}"</p>
            `;

            if (commentsList) {
                commentsList.insertBefore(newComment, commentsList.childNodes[2]);
            }
            
            commentForm.reset();
            showNotification(t.commentSuccess, t.commentSuccessMessage);
        });
    }

    toggleEnfants();
});
