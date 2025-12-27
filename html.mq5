<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maroc Travel | L'Essence du Voyage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- EmailJS SDK -->
    <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <style>
        :root {
            --sable: #E6CEA8;
            --ocre: #D4A55E;
            --bleu-majorelle: #3A6BC4;
            --vert-oasis: #2E8B57;
            --rouge-terracotta: #B3543C;
            --blanc: #FFFFFF;
            --texte: #333333;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            color: var(--texte);
            line-height: 1.6;
            overflow-x: hidden;
            transition: all 0.3s ease;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        #langToggle {
            position: fixed;
            top: 100px;
            right: 20px;
            z-index: 1000;
            background: linear-gradient(135deg, var(--ocre), var(--rouge-terracotta));
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        #langToggle:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        #langToggle i {
            font-size: 16px;
        }

        body[dir="rtl"] {
            direction: rtl;
            text-align: right;
        }

        body[dir="rtl"] .navbar,
        body[dir="rtl"] .nav-links,
        body[dir="rtl"] .footer-content {
            flex-direction: row-reverse;
        }

        body[dir="rtl"] .form-group-checkbox,
        body[dir="rtl"] .enfant-group,
        body[dir="rtl"] .commentaire-header {
            flex-direction: row-reverse;
        }

        body[dir="rtl"] .contact-info p i {
            margin-right: 0;
            margin-left: 10px;
        }

        body[dir="rtl"] #langToggle {
            right: auto;
            left: 20px;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .header {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1489749798305-4fea3ae63d43?w=1920&h=1080&fit=crop');
            background-size: cover;
            background-position: center;
            color: var(--blanc);
            padding: 20px 0;
            position: relative;
            overflow: hidden;
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            animation: fadeInDown 0.8s ease-out;
            position: relative;
            z-index: 10;
        }
        
        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: var(--sable);
        }
        
        .logo span {
            color: var(--bleu-majorelle);
        }
        
        .nav-links {
            display: flex;
            list-style: none;
        }
        
        .nav-links li {
            margin-left: 30px;
        }
        
        .nav-links a {
            color: var(--blanc);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-links a:hover {
            color: var(--sable);
        }
        
        .hero {
            text-align: center;
            padding: 100px 20px 120px;
            position: relative;
            overflow: hidden;
            z-index: 5;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            color: var(--blanc);
            opacity: 0;
            animation: fadeInUp 1s ease-out 0.2s forwards;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.5);
        }
        
        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 40px;
            color: var(--sable);
            opacity: 0;
            animation: fadeInUp 1s ease-out 0.5s forwards;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.5);
        }
        
        .cta-button {
            display: inline-block;
            background: linear-gradient(135deg, var(--ocre), var(--rouge-terracotta));
            color: var(--blanc);
            padding: 15px 40px;
            text-decoration: none;
            border-radius: 30px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s;
            opacity: 0;
            animation: fadeInUp 1s ease-out 0.8s forwards;
            box-shadow: 0 10px 30px rgba(212, 165, 94, 0.4);
        }
        
        .cta-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(212, 165, 94, 0.6);
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            color: var(--bleu-majorelle);
            margin: 60px 0 40px;
            position: relative;
        }
        
        .section-title:after {
            content: "";
            display: block;
            width: 80px;
            height: 4px;
            background-color: var(--ocre);
            margin: 15px auto;
        }
        
        .villes-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }
        
        .ville-card {
            background-color: var(--blanc);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .ville-card:hover {
            transform: translateY(-10px);
        }
        
        .ville-img {
            height: 250px;
            width: 100%;
            object-fit: cover;
            display: block;
            background-color: #f0f0f0;
        }

        .ville-content {
            padding: 20px;
        }
        
        .ville-content h3 {
            color: var(--bleu-majorelle);
            margin-bottom: 10px;
            font-size: 1.5rem;
        }
        
        .ville-content p {
            color: #666;
            margin-bottom: 15px;
            font-size: 0.95rem;
        }
        
        .ville-price {
            color: var(--rouge-terracotta);
            font-weight: bold;
            font-size: 1.2rem;
        }
        
        .reservation-section {
            background-color: var(--blanc);
            padding: 60px 20px;
            margin: 40px 0;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            position: relative;
        }
        
        .reservation-form {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .form-group {
            flex: 1;
            min-width: 250px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--bleu-majorelle);
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--ocre);
            outline: none;
        }

        .form-control.error {
            border-color: var(--rouge-terracotta);
            background-color: #fff5f5;
        }

        .error-message {
            color: var(--rouge-terracotta);
            font-size: 0.85rem;
            margin-top: 5px;
            display: none;
        }

        .error-message.show {
            display: block;
        }
        
        .enfant-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        
        .confirmation-indicator {
            position: fixed;
            top: 100px;
            right: 20px;
            background-color: var(--vert-oasis);
            color: white;
            padding: 15px 25px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            display: none;
            align-items: center;
            gap: 12px;
            z-index: 1000;
            animation: slideIn 0.5s ease-out;
            max-width: 350px;
        }

        .confirmation-indicator.error-notification {
            background-color: var(--rouge-terracotta);
        }
        
        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        .confirmation-content {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        
        .confirmation-title {
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .confirmation-message {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .confirmation-close {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 1.2rem;
            padding: 5px;
        }
        
        .commentaires-section {
            background-color: #f5f1e8;
            padding: 60px 20px;
            margin: 40px 0;
        }
        
        .comment-form {
            max-width: 800px;
            margin: 0 auto 40px;
        }
        
        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }
        
        .commentaires-list {
            max-width: 800px;
            margin: 40px auto 0;
        }
        
        .commentaire {
            background-color: var(--blanc);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }
        
        .commentaire-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 0.9rem;
            color: #777;
        }
        
        .footer {
            background-color: #222;
            color: var(--blanc);
            padding: 60px 20px 30px;
            margin-top: 60px;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }
        
        .footer-logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: var(--sable);
            margin-bottom: 15px;
        }
        
        .footer-contact h3 {
            color: var(--sable);
            margin-bottom: 20px;
            font-size: 1.2rem;
        }
        
        .contact-info {
            margin-bottom: 20px;
        }
        
        .contact-info p {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .contact-info i {
            margin-right: 10px;
            color: var(--ocre);
        }
        
        .copyright {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid #444;
            color: #aaa;
            font-size: 0.9rem;
        }
        
        .submit-btn {
            background-color: var(--vert-oasis);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 30px auto 0;
        }
        
        .submit-btn:hover {
            background-color: var(--bleu-majorelle);
        }

        .submit-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                text-align: center;
            }
            
            .nav-links {
                margin-top: 20px;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .nav-links li {
                margin: 10px 15px;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .confirmation-indicator {
                top: 80px;
                right: 10px;
                left: 10px;
                max-width: none;
            }

            #langToggle {
                top: 80px;
                right: 10px;
                padding: 10px 15px;
                font-size: 12px;
            }

            body[dir="rtl"] #langToggle {
                right: auto;
                left: 10px;
            }
        }
    </style>
</head>
<body>
    <button id="langToggle">
        <i class="fas fa-globe"></i> FR
    </button>
    
    <div class="confirmation-indicator" id="confirmationIndicator">
        <i class="fas fa-check-circle" style="font-size: 1.8rem;" id="notificationIcon"></i>
        <div class="confirmation-content">
            <div class="confirmation-title" id="notificationTitle">Demande envoyée !</div>
            <div class="confirmation-message" id="confirmationMessage">Votre réservation a bien été reçue.</div>
        </div>
        <button class="confirmation-close" id="closeConfirmation">
            <i class="fas fa-times"></i>
        </button>
    </div>
    
    <header class="header">
        <div class="container">
            <nav class="navbar">
                <div class="logo" id="logo">MAROC<span>TRAVEL</span></div>
                <ul class="nav-links">
                    <li><a href="#accueil" id="nav-accueil">Accueil</a></li>
                    <li><a href="#villes" id="nav-destinations">Destinations</a></li>
                    <li><a href="#reservation" id="nav-reserver">Réserver</a></li>
                    <li><a href="#commentaires" id="nav-avis">Avis</a></li>
                    <li><a href="#contact" id="nav-contact">Contact</a></li>
                </ul>
            </nav>
            
            <div class="hero" id="accueil">
                <h1 id="hero-title">Découvrez la Magie du Maroc</h1>
                <p id="hero-description">Des médinas animées aux dunes dorées du Sahara, vivez une aventure inoubliable avec Maroc Travel. Circuits personnalisés, guides locaux et expériences authentiques.</p>
                <a href="#reservation" class="cta-button" id="hero-button">Planifiez votre voyage</a>
            </div>
        </div>
    </header>
    
    <section class="container" id="villes">
        <h2 class="section-title" id="villes-title">Villes Marocaines à Découvrir</h2>
        <p style="text-align: center; margin-bottom: 40px; max-width: 800px; margin-left: auto; margin-right: auto;" id="villes-intro">
            Le Maroc accueille chaque année plus de 17 millions de visiteurs grâce à ses paysages diversifiés, ses villes historiques et sa culture riche. Découvrez nos destinations phares.
        </p>
        
        <div class="villes-grid">
            <div class="ville-card">
                <div class="ville-content">
                    <h3 id="ville-1-nom">Marrakech</h3>
                    <p id="ville-1-desc">La ville rouge, célèbre pour sa place Jemaa el-Fna, ses souks animés et ses palais historiques. Explorez les jardins Majorelle et la médina classée à l'UNESCO.</p>
                    <div class="ville-price" id="ville-1-prix">À partir de 650€ / personne</div>
                </div>
            </div>
            
            <div class="ville-card">
                <div class="ville-content">
                    <h3 id="ville-2-nom">Fès</h3>
                    <p id="ville-2-desc">Ville impériale abritant la plus ancienne médina du monde et l'université Al Quaraouiyine. Découvrez les tanneries traditionnelles et l'artisanat local.</p>
                    <div class="ville-price" id="ville-2-prix">À partir de 590€ / personne</div>
                </div>
            </div>
            
            <div class="ville-card">
                <div class="ville-content">
                    <h3 id="ville-3-nom">Chefchaouen</h3>
                    <p id="ville-3-desc">La célèbre ville bleue nichée dans les montagnes du Rif. Parfaite pour la photographie, les randonnées et l'immersion dans une ambiance paisible et authentique.</p>
                    <div class="ville-price" id="ville-3-prix">À partir de 520€ / personne</div>
                </div>
            </div>
            
            <div class="ville-card">
                <div class="ville-content">
                    <h3 id="ville-4-nom">Essaouira</h3>
                    <p id="ville-4-desc">Ville côtière au charme bohème, réputée pour son vent constant, sa médina fortifiée et son festival de musique Gnaoua. Idéale pour les sports nautiques.</p>
                    <div class="ville-price" id="ville-4-prix">À partir de 480€ / personne</div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="container" id="reservation">
        <div class="reservation-section">
            <h2 class="section-title" id="reservation-title">Réservez Votre Voyage</h2>
            <p style="text-align: center; margin-bottom: 40px; max-width: 700px; margin-left: auto; margin-right: auto;" id="reservation-intro">
                Remplissez ce formulaire pour recevoir une proposition de voyage personnalisée selon vos préférences et le nombre de participants.
            </p>
            
            <form class="reservation-form" id="bookingForm" novalidate>
                <div class="form-row">
                    <div class="form-group">
                        <label for="nom" id="label-nom">Nom complet *</label>
                        <input type="text" id="nom" class="form-control" required minlength="2">
                        <div class="error-message" id="nomError">Veuillez entrer un nom valide (min. 2 caractères)</div>
                    </div>
                    <div class="form-group">
                        <label for="email" id="label-email">Email *</label>
                        <input type="email" id="email" class="form-control" required>
                        <div class="error-message" id="emailError">Veuillez entrer une adresse email valide</div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="telephone" id="label-telephone">Téléphone *</label>
                        <input type="tel" id="telephone" class="form-control" required pattern="[0-9]{10}">
                        <div class="error-message" id="telephoneError">Veuillez entrer un numéro valide (10 chiffres)</div>
                    </div>
                    <div class="form-group">
                        <label for="ville" id="label-ville">Ville souhaitée *</label>
                        <select id="ville" class="form-control" required>
                            <option value="">Sélectionnez une ville</option>
                            <option value="Marrakech">Marrakech</option>
                            <option value="Fès">Fès</option>
                            <option value="Chefchaouen">Chefchaouen</option>
                            <option value="Essaouira">Essaouira</option>
                            <option value="Agadir">Agadir</option>
                            <option value="Rabat">Rabat</option>
                            <option value="Tanger">Tanger</option>
                        </select>
                        <div class="error-message" id="villeError">Veuillez sélectionner une ville</div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="date" id="label-date">Dates souhaitées *</label>
                        <input type="date" id="date" class="form-control" required>
                        <div class="error-message" id="dateError">Veuillez sélectionner une date</div>
                    </div>
                    <div class="form-group">
                        <label for="personnes" id="label-personnes">Nombre de personnes *</label>
                        <input type="number" id="personnes" class="form-control" min="1" max="20" value="2" required>
                        <div class="error-message" id="personnesError">Entre 1 et 20 personnes</div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label id="label-enfants">Voyage avec des enfants ?</label>
                    <div class="enfant-group">
                        <input type="radio" id="enfant-oui" name="enfants" value="oui">
                        <label for="enfant-oui" id="label-oui">Oui</label>
                        <input type="radio" id="enfant-non" name="enfants" value="non" checked>
                        <label for="enfant-non" id="label-non">Non</label>
                    </div>
                </div>
                
                <div class="form-group" id="nombreEnfants" style="display: none;">
                    <label for="nbEnfants" id="label-nbenfants">Nombre d'enfants</label>
                    <input type="number" id="nbEnfants" class="form-control" min="1" max="10" value="1">
                </div>
                
                <div class="form-group">
                    <label for="message" id="label-message">Message complémentaire</label>
                    <textarea id="message" class="form-control" placeholder="Précisez vos centres d'intérêt, le type d'hébergement souhaité, etc."></textarea>
                </div>
                
                <button type="submit" class="submit-btn" id="submitBtn">Envoyer ma demande de réservation</button>
            </form>
        </div>
    </section>
    
    <section class="commentaires-section" id="commentaires">
        <div class="container">
            <h2 class="section-title" id="commentaires-title">Espace Commentaires</h2>
            <p style="text-align: center; margin-bottom: 40px; max-width: 700px; margin-left: auto; margin-right: auto;" id="commentaires-intro">
                Partagez votre expérience de voyage au Maroc ou posez vos questions à notre communauté. Vos retours nous aident à améliorer nos services.
            </p>
            
            <form class="comment-form" id="commentForm">
                <div class="form-row">
                    <div class="form-group">
                        <label for="commentNom" id="label-commentnom">Votre nom</label>
                        <input type="text" id="commentNom" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="commentEmail" id="label-commentemail">Votre email (non publié)</label>
                        <input type="email" id="commentEmail" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="commentText" id="label-commenttext">Votre commentaire *</label>
                    <textarea id="commentText" class="form-control" required placeholder="Partagez votre avis sur nos voyages, vos expériences au Maroc, ou posez vos questions..."></textarea>
                    <div class="error-message" id="commentError">Veuillez saisir un commentaire</div>
                </div>
                
                <button type="submit" class="submit-btn" id="submitCommentBtn">Publier mon commentaire</button>
            </form>
            
            <div class="commentaires-list" id="commentsList">
                <h3 style="text-align: center; margin: 50px 0 30px; color: var(--bleu-majorelle);" id="avis-title">Derniers avis voyageurs</h3>
                
                <div class="commentaire">
                    <div class="commentaire-header">
                        <span><strong id="comment-1-nom">Sophie L.</strong></span>
                        <span id="comment-1-date">15 Novembre 2025</span>
                    </div>
                    <p id="comment-1-text">"Superbe voyage à Marrakech organisé par Maroc Travel. L'équipe était très professionnelle et les activités proposées correspondaient parfaitement à nos attentes. Mention spéciale pour le guide local, très connaisseur !"</p>
                </div>
                
                <div class="commentaire">
                    <div class="commentaire-header">
                        <span><strong id="comment-2-nom">Thomas M.</strong></span>
                        <span id="comment-2-date">2 Novembre 2025</span>
                    </div>
                    <p id="comment-2-text">"Circuit Fès - Chefchaouen impeccable. Organisation sans faille, hébergements de qualité et chauffeur très sympathique. Nous recommandons vivement cette agence pour découvrir le Maroc authentique."</p>
                </div>
            </div>
        </div>
    </section>
    
    <footer class="footer" id="contact">
        <div class="container">
            <div class="footer-content">
                <div>
                    <div class="footer-logo" id="footer-logo">MAROC<span>TRAVEL</span></div>
                    <p id="footer-description">Votre partenaire de confiance pour des voyages authentiques et mémorables au Maroc. Nous créons des expériences sur mesure qui captent l'essence de ce pays magnifique.</p>
                </div>
                
                <div class="footer-contact">
                    <h3 id="footer-contact-title">Contactez-nous</h3>
                    <div class="contact-info">
                        <p><i class="fas fa-phone"></i> 0640058671</p>
                        <p><i class="fas fa-envelope"></i> alaouimohammed2040@gmail.com</p>
                        <p><i class="fas fa-map-marker-alt"></i> Agence Maroc Travel, Maroc</p>
                        <p><i class="fas fa-clock"></i> <strong id="footer-disponible">Disponible 24h/24 et 7j/7</strong></p>
                    </div>
                    <p id="footer-conseils">La meilleure période pour visiter le Maroc est le printemps (mars à mai) ou l'automne (septembre à novembre) lorsque le temps est doux et agréable. Pensez à réserver à l'avance pendant les périodes de pointe.</p>
                </div>
                
                <div>
                    <h3 style="color: var(--sable); margin-bottom: 20px; font-size: 1.2rem;" id="footer-tips-title">Conseils de voyage</h3>
                    <p id="footer-tips-text">La meilleure période pour visiter le Maroc est le printemps (mars à mai) ou l'automne (septembre à novembre) lorsque le temps est doux et agréable. Pensez à réserver à l'avance pendant les périodes de pointe.</p>
                </div>
            </div>
            
            <div class="copyright">
                <p id="copyright-text">&copy; 2025 Maroc Travel - Tous droits réservés. | Agence de voyage spécialisée sur le Maroc</p>
            </div>
        </div>
    </footer>
    
    <script>
        // ========== INITIALISER EMAILJS ==========
        emailjs.init("xVzOSTRGC6qMp_mxO");

        // ========== TRADUCTIONS ==========
        const translations = {
            fr: {
                logo: "MAROC<span>TRAVEL</span>",
                navAccueil: "Accueil",
                navDestinations: "Destinations",
                navReserver: "Réserver",
                navAvis: "Avis",
                navContact: "Contact",
                heroTitle: "Découvrez la Magie du Maroc",
                heroDescription: "Des médinas animées aux dunes dorées du Sahara, vivez une aventure inoubliable avec Maroc Travel. Circuits personnalisés, guides locaux et expériences authentiques.",
                heroButton: "Planifiez votre voyage",
                villesTitle: "Villes Marocaines à Découvrir",
                villesIntro: "Le Maroc accueille chaque année plus de 17 millions de visiteurs grâce à ses paysages diversifiés, ses villes historiques et sa culture riche. Découvrez nos destinations phares.",
                ville1: "Marrakech",
                ville1Desc: "La ville rouge, célèbre pour sa place Jemaa el-Fna, ses souks animés et ses palais historiques. Explorez les jardins Majorelle et la médina classée à l'UNESCO.",
                ville2: "Fès",
                ville2Desc: "Ville impériale abritant la plus ancienne médina du monde et l'université Al Quaraouiyine. Découvrez les tanneries traditionnelles et l'artisanat local.",
                ville3: "Chefchaouen",
                ville3Desc: "La célèbre ville bleue nichée dans les montagnes du Rif. Parfaite pour la photographie, les randonnées et l'immersion dans une ambiance paisible et authentique.",
                ville4: "Essaouira",
                ville4Desc: "Ville côtière au charme bohème, réputée pour son vent constant, sa médina fortifiée et son festival de musique Gnaoua. Idéale pour les sports nautiques.",
                prix: "À partir de",
                reservationTitle: "Réservez Votre Voyage",
                reservationIntro: "Remplissez ce formulaire pour recevoir une proposition de voyage personnalisée selon vos préférences et le nombre de participants.",
                labelNom: "Nom complet *",
                labelEmail: "Email *",
                labelTelephone: "Téléphone *",
                labelVille: "Ville souhaitée *",
                labelDate: "Dates souhaitées *",
                labelPersonnes: "Nombre de personnes *",
                labelEnfants: "Voyage avec des enfants ?",
                labelOui: "Oui",
                labelNon: "Non",
                labelNbEnfants: "Nombre d'enfants",
                labelMessage: "Message complémentaire",
                submitBtn: "Envoyer ma demande de réservation",
                sending: "Envoi en cours...",
                successTitle: "Demande envoyée !",
                successMsg: "Un email de confirmation vous a été envoyé.",
                errorTitle: "Erreur",
                errorMsg: "Une erreur est survenue. Veuillez réessayer.",
                commentairesTitle: "Espace Commentaires",
                commentairesIntro: "Partagez votre expérience de voyage au Maroc ou posez vos questions à notre communauté. Vos retours nous aident à améliorer nos services.",
                labelCommentNom: "Votre nom",
                labelCommentEmail: "Votre email (non publié)",
                labelCommentText: "Votre commentaire *",
                submitCommentBtn: "Publier mon commentaire",
                avisTitle: "Derniers avis voyageurs",
                comment1Nom: "Sophie L.",
                comment1Date: "15 Novembre 2025",
                comment1Text: '"Superbe voyage à Marrakech organisé par Maroc Travel. L\'équipe était très professionnelle et les activités proposées correspondaient parfaitement à nos attentes. Mention spéciale pour le guide local, très connaisseur !"',
                comment2Nom: "Thomas M.",
                comment2Date: "2 Novembre 2025",
                comment2Text: '"Circuit Fès - Chefchaouen impeccable. Organisation sans faille, hébergements de qualité et chauffeur très sympathique. Nous recommandons vivement cette agence pour découvrir le Maroc authentique."',
                footerDescription: "Votre partenaire de confiance pour des voyages authentiques et mémorables au Maroc. Nous créons des expériences sur mesure qui captent l'essence de ce pays magnifique.",
                footerContactTitle: "Contactez-nous",
                footerDisponible: "Disponible 24h/24 et 7j/7",
                footerTipsTitle: "Conseils de voyage",
                footerTipsText: "La meilleure période pour visiter le Maroc est le printemps (mars à mai) ou l'automne (septembre à novembre) lorsque le temps est doux et agréable. Pensez à réserver à l'avance pendant les périodes de pointe.",
                copyrightText: "© 2025 Maroc Travel - Tous droits réservés. | Agence de voyage spécialisée sur le Maroc"
            },
            en: {
                logo: "MOROCCO<span>TRAVEL</span>",
                navAccueil: "Home",
                navDestinations: "Destinations",
                navReserver: "Book",
                navAvis: "Reviews",
                navContact: "Contact",
                heroTitle: "Discover the Magic of Morocco",
                heroDescription: "From bustling medinas to golden Sahara dunes, experience an unforgettable adventure with Morocco Travel. Custom tours, local guides, and authentic experiences.",
                heroButton: "Plan your trip",
                villesTitle: "Moroccan Cities to Discover",
                villesIntro: "Morocco welcomes over 17 million visitors annually thanks to its diverse landscapes, historic cities, and rich culture. Discover our top destinations.",
                ville1: "Marrakech",
                ville1Desc: "The Red City, famous for its Jemaa el-Fna square, vibrant souks, and historic palaces. Explore the Majorelle Gardens and the UNESCO-listed medina.",
                ville2: "Fes",
                ville2Desc: "Imperial city home to the world's oldest medina and Al Quaraouiyine University. Discover traditional tanneries and local crafts.",
                ville3: "Chefchaouen",
                ville3Desc: "The famous Blue City nestled in the Rif Mountains. Perfect for photography, hiking, and immersion in a peaceful, authentic atmosphere.",
                ville4: "Essaouira",
                ville4Desc: "Coastal city with bohemian charm, known for its constant wind, fortified medina, and Gnaoua music festival. Ideal for water sports.",
                prix: "From",
                reservationTitle: "Book Your Trip",
                reservationIntro: "Fill out this form to receive a personalized travel proposal based on your preferences and number of participants.",
                labelNom: "Full name *",
                labelEmail: "Email *",
                labelTelephone: "Phone *",
                labelVille: "Preferred city *",
                labelDate: "Preferred dates *",
                labelPersonnes: "Number of people *",
                labelEnfants: "Traveling with children?",
                labelOui: "Yes",
                labelNon: "No",
                labelNbEnfants: "Number of children",
                labelMessage: "Additional message",
                submitBtn: "Send my booking request",
                sending: "Sending...",
                successTitle: "Request sent!",
                successMsg: "A confirmation email has been sent to you.",
                errorTitle: "Error",
                errorMsg: "An error occurred. Please try again.",
                commentairesTitle: "Comments Section",
                commentairesIntro: "Share your travel experience in Morocco or ask questions to our community. Your feedback helps us improve our services.",
                labelCommentNom: "Your name",
                labelCommentEmail: "Your email (not published)",
                labelCommentText: "Your comment *",
                submitCommentBtn: "Publish my comment",
                avisTitle: "Latest traveler reviews",
                comment1Nom: "Sophie L.",
                comment1Date: "November 15, 2025",
                comment1Text: '"Wonderful trip to Marrakech organized by Morocco Travel. The team was very professional and the proposed activities perfectly matched our expectations. Special mention to the local guide, very knowledgeable!"',
                comment2Nom: "Thomas M.",
                comment2Date: "November 2, 2025",
                comment2Text: '"Fes - Chefchaouen circuit impeccable. Flawless organization, quality accommodations, and very friendly driver. We highly recommend this agency to discover authentic Morocco."',
                footerDescription: "Your trusted partner for authentic and memorable trips to Morocco. We create tailor-made experiences that capture the essence of this magnificent country.",
                footerContactTitle: "Contact us",
                footerDisponible: "Available 24/7",
                footerTipsTitle: "Travel tips",
                footerTipsText: "The best time to visit Morocco is spring (March to May) or autumn (September to November) when the weather is mild and pleasant. Remember to book in advance during peak periods.",
                copyrightText: "© 2025 Morocco Travel - All rights reserved. | Specialized travel agency for Morocco"
            },
            ar: {
                logo: "المغرب<span>للسفر</span>",
                navAccueil: "الرئيسية",
                navDestinations: "الوجهات",
                navReserver: "الحجز",
                navAvis: "الآراء",
                navContact: "اتصل بنا",
                heroTitle: "اكتشف سحر المغرب",
                heroDescription: "من الأزقة النابضة بالحياة إلى الكثبان الذهبية للصحراء، عش مغامرة لا تُنسى مع المغرب للسفر. جولات مخصصة، مرشدون محليون، وتجارب أصيلة.",
                heroButton: "خطط لرحلتك",
                villesTitle: "مدن مغربية لاكتشافها",
                villesIntro: "يستقبل المغرب أكثر من 17 مليون زائر سنويًا بفضل مناظره الطبيعية المتنوعة، ومدنه التاريخية، وثقافته الغنية. اكتشف أفضل الوجهات لدينا.",
                ville1: "مراكش",
                ville1Desc: "المدينة الحمراء، المشهورة بساحة جامع الفنا، وأسواقها النابضة، وقصورها التاريخية. استكشف حدائق ماجوريل والمدينة القديمة المصنفة ضمن التراث العالمي لليونسكو.",
                ville2: "فاس",
                ville2Desc: "المدينة الإمبراطورية التي تضم أقدم مدينة قديمة في العالم وجامعة القرويين. اكتشف المدابغ التقليدية والحرف المحلية.",
                ville3: "شفشاون",
                ville3Desc: "المدينة الزرقاء الشهيرة الواقعة في جبال الريف. مثالية للتصوير، المشي لمسافات طويلة، والانغماس في جو هادئ وأصيل.",
                ville4: "الصويرة",
                ville4Desc: "مدينة ساحلية ذات سحر بوهيمي، معروفة برياحها الدائمة، ومدينتها القديمة المحصنة، ومهرجان موسيقى كناوة. مثالية للرياضات المائية.",
                prix: "ابتداءً من",
                reservationTitle: "احجز رحلتك",
                reservationIntro: "املأ هذا النموذج لتلقي اقتراح سفر مخصص بناءً على تفضيلاتك وعدد المشاركين.",
                labelNom: "الاسم الكامل *",
                labelEmail: "البريد الإلكتروني *",
                labelTelephone: "الهاتف *",
                labelVille: "المدينة المفضلة *",
                labelDate: "التواريخ المفضلة *",
                labelPersonnes: "عدد الأشخاص *",
                labelEnfants: "السفر مع الأطفال؟",
                labelOui: "نعم",
                labelNon: "لا",
                labelNbEnfants: "عدد الأطفال",
                labelMessage: "رسالة إضافية",
                submitBtn: "أرسل طلب الحجز الخاص بي",
                sending: "جاري الإرسال...",
                successTitle: "تم إرسال الطلب!",
                successMsg: "تم إرسال بريد تأكيد إليك.",
                errorTitle: "خطأ",
                errorMsg: "حدث خطأ. حاول مرة أخرى.",
                commentairesTitle: "قسم التعليقات",
                commentairesIntro: "شارك تجربة سفرك في المغرب أو اطرح أسئلة على مجتمعنا. ملاحظاتك تساعدنا على تحسين خدماتنا.",
                labelCommentNom: "اسمك",
                labelCommentEmail: "بريدك الإلكتروني (غير منشور)",
                labelCommentText: "تعليقك *",
                submitCommentBtn: "نشر تعليقي",
                avisTitle: "آخر آراء المسافرين",
                comment1Nom: "صوفي ل.",
                comment1Date: "15 نوفمبر 2025",
                comment1Text: '"رحلة رائعة إلى مراكش نظمتها المغرب للسفر. كان الفريق محترفًا جدًا والأنشطة المقترحة تطابقت تمامًا مع توقعاتنا. ذكر خاص للمرشد المحلي، كان على دراية كبيرة!"',
                comment2Nom: "توماس م.",
                comment2Date: "2 نوفمبر 2025",
                comment2Text: '"دائرة فاس - شفشاون لا تشوبها شائبة. تنظيم لا عيب فيه، إقامات عالية الجودة، وسائق ودود للغاية. نوصي بشدة بهذه الوكالة لاكتشاف المغرب الأصيل."',
                footerDescription: "شريكك الموثوق لرحلات أصيلة ولا تُنسى إلى المغرب. نخلق تجارب مخصصة تلتقط جوهر هذا البلد الرائع.",
                footerContactTitle: "اتصل بنا",
                footerDisponible: "متاح على مدار 24 ساعة وطوال أيام الأسبوع",
                footerTipsTitle: "نصائح السفر",
                footerTipsText: "أفضل وقت لزيارة المغرب هو الربيع (مارس إلى مايو) أو الخريف (سبتمبر إلى نوفمبر) عندما يكون الطقس معتدلًا وممتعًا. تذكر الحجز مسبقًا خلال فترات الذروة.",
                copyrightText: "© 2025 المغرب للسفر - جميع الحقوق محفوظة. | وكالة سفر متخصصة في المغرب"
            }
        };

        // ========== FONCTION DE CHANGEMENT DE LANGUE ==========
        let currentLang = 'fr';
        
        function changeLanguage(lang) {
            currentLang = lang;
            const t = translations[lang];
            
            document.getElementById('langToggle').innerHTML = `<i class="fas fa-globe"></i> ${lang.toUpperCase()}`;
            
            document.getElementById('logo').innerHTML = t.logo;
            document.getElementById('nav-accueil').textContent = t.navAccueil;
            document.getElementById('nav-destinations').textContent = t.navDestinations;
            document.getElementById('nav-reserver').textContent = t.navReserver;
            document.getElementById('nav-avis').textContent = t.navAvis;
            document.getElementById('nav-contact').textContent = t.navContact;
            document.getElementById('hero-title').textContent = t.heroTitle;
            document.getElementById('hero-description').textContent = t.heroDescription;
            document.getElementById('hero-button').textContent = t.heroButton;
            document.getElementById('villes-title').textContent = t.villesTitle;
            document.getElementById('villes-intro').textContent = t.villesIntro;
            
            document.getElementById('ville-1-nom').textContent = t.ville1;
            document.getElementById('ville-1-desc').textContent = t.ville1Desc;
            document.getElementById('ville-1-prix').textContent = `${t.prix} 650€ / personne`;
            
            document.getElementById('ville-2-nom').textContent = t.ville2;
            document.getElementById('ville-2-desc').textContent = t.ville2Desc;
            document.getElementById('ville-2-prix').textContent = `${t.prix} 590€ / personne`;
            
            document.getElementById('ville-3-nom').textContent = t.ville3;
            document.getElementById('ville-3-desc').textContent = t.ville3Desc;
            document.getElementById('ville-3-prix').textContent = `${t.prix} 520€ / personne`;
            
            document.getElementById('ville-4-nom').textContent = t.ville4;
            document.getElementById('ville-4-desc').textContent = t.ville4Desc;
            document.getElementById('ville-4-prix').textContent = `${t.prix} 480€ / personne`;
            
            document.getElementById('reservation-title').textContent = t.reservationTitle;
            document.getElementById('reservation-intro').textContent = t.reservationIntro;
            document.getElementById('label-nom').textContent = t.labelNom;
            document.getElementById('label-email').textContent = t.labelEmail;
            document.getElementById('label-telephone').textContent = t.labelTelephone;
            document.getElementById('label-ville').textContent = t.labelVille;
            document.getElementById('label-date').textContent = t.labelDate;
            document.getElementById('label-personnes').textContent = t.labelPersonnes;
            document.getElementById('label-enfants').textContent = t.labelEnfants;
            document.getElementById('label-oui').textContent = t.labelOui;
            document.getElementById('label-non').textContent = t.labelNon;
            document.getElementById('label-nbenfants').textContent = t.labelNbEnfants;
            document.getElementById('label-message').textContent = t.labelMessage;
            
            const submitBtn = document.getElementById('submitBtn');
            if (!submitBtn.disabled) {
                submitBtn.textContent = t.submitBtn;
            }
            
            document.getElementById('commentaires-title').textContent = t.commentairesTitle;
            document.getElementById('commentaires-intro').textContent = t.commentairesIntro;
            document.getElementById('label-commentnom').textContent = t.labelCommentNom;
            document.getElementById('label-commentemail').textContent = t.labelCommentEmail;
            document.getElementById('label-commenttext').textContent = t.labelCommentText;
            document.getElementById('submitCommentBtn').textContent = t.submitCommentBtn;
            document.getElementById('avis-title').textContent = t.avisTitle;
            document.getElementById('comment-1-nom').textContent = t.comment1Nom;
            document.getElementById('comment-1-date').textContent = t.comment1Date;
            document.getElementById('comment-1-text').textContent = t.comment1Text;
            document.getElementById('comment-2-nom').textContent = t.comment2Nom;
            document.getElementById('comment-2-date').textContent = t.comment2Date;
            document.getElementById('comment-2-text').textContent = t.comment2Text;
            
            document.getElementById('footer-logo').innerHTML = t.logo;
            document.getElementById('footer-description').textContent = t.footerDescription;
            document.getElementById('footer-contact-title').textContent = t.footerContactTitle;
            document.getElementById('footer-disponible').textContent = t.footerDisponible;
            document.getElementById('footer-tips-title').textContent = t.footerTipsTitle;
            document.getElementById('footer-tips-text').textContent = t.footerTipsText;
            document.getElementById('footer-conseils').textContent = t.footerTipsText;
            document.getElementById('copyright-text').textContent = t.copyrightText;
            
            if (lang === 'ar') {
                document.body.dir = 'rtl';
            } else {
                document.body.dir = 'ltr';
            }
            
            localStorage.setItem('preferredLanguage', lang);
        }

        // ========== GESTION DU BOUTON DE LANGUE ==========
        document.getElementById('langToggle').addEventListener('click', function() {
            const languages = ['fr', 'en', 'ar'];
            const currentIndex = languages.indexOf(currentLang);
            const nextIndex = (currentIndex + 1) % languages.length;
            changeLanguage(languages[nextIndex]);
        });

        // ========== CHARGER LA LANGUE SAUVEGARDÉE ==========
        const savedLang = localStorage.getItem('preferredLanguage');
        if (savedLang && translations[savedLang]) {
            changeLanguage(savedLang);
        }

        // ========== GESTION DES ENFANTS ==========
        document.querySelectorAll('input[name="enfants"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const enfantsField = document.getElementById('nombreEnfants');
                if (this.value === 'oui') {
                    enfantsField.style.display = 'block';
                } else {
                    enfantsField.style.display = 'none';
                }
            });
        });

        // ========== NOTIFICATIONS ==========
        const indicator = document.getElementById('confirmationIndicator');
        const closeBtn = document.getElementById('closeConfirmation');

        function showNotification(title, message, isError = false) {
            const titleEl = document.getElementById('notificationTitle');
            const msgEl = document.getElementById('confirmationMessage');
            const icon = document.getElementById('notificationIcon');

            titleEl.textContent = title;
            msgEl.textContent = message;
            
            if (isError) {
                indicator.classList.add('error-notification');
                icon.className = 'fas fa-exclamation-circle';
            } else {
                indicator.classList.remove('error-notification');
                icon.className = 'fas fa-check-circle';
            }

            indicator.style.display = 'flex';
            setTimeout(() => { indicator.style.display = 'none'; }, 5000);
        }

        closeBtn.addEventListener('click', () => { indicator.style.display = 'none'; });

        // ========== FORMULAIRE DE RÉSERVATION ==========
        document.getElementById('bookingForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const t = translations[currentLang];
            const submitBtn = document.getElementById('submitBtn');
            const originalText = submitBtn.textContent;
            
            // Désactiver le bouton
            submitBtn.disabled = true;
            submitBtn.textContent = t.sending;
            
            // Récupérer les données
            const nom = document.getElementById('nom').value;
            const clientEmail = document.getElementById('email').value;
            const telephone = document.getElementById('telephone').value;
            const ville = document.getElementById('ville').value;
            const date = document.getElementById('date').value;
            const personnes = document.getElementById('personnes').value;
            const avecEnfants = document.getElementById('enfant-oui').checked;
            const nbEnfants = avecEnfants ? document.getElementById('nbEnfants').value : '0';
            const message = document.getElementById('message').value || 'Aucun message';

            // Données pour Formspree (email à vous)
            const formData = new FormData();
            formData.append('Nom', nom);
            formData.append('Email', clientEmail);
            formData.append('Téléphone', telephone);
            formData.append('Ville', ville);
            formData.append('Date', date);
            formData.append('Nombre de personnes', personnes);
            formData.append('Avec enfants', avecEnfants ? 'Oui' : 'Non');
            if (avecEnfants) {
                formData.append('Nombre d\'enfants', nbEnfants);
            }
            formData.append('Message', message);
            formData.append('Date de soumission', new Date().toLocaleString('fr-FR'));
            formData.append('_subject', '🔔 Nouvelle réservation de ' + nom);

            // Données pour EmailJS (email au client)
            const emailParams = {
                nom: nom,
                client_email: clientEmail,
                telephone: telephone,
                ville: ville,
                date: date,
                personnes: personnes,
                enfants: avecEnfants ? `Oui (${nbEnfants} enfant(s))` : 'Non',
                message: message
            };

            try {
                // 1. Envoyer à vous via Formspree
                const formspreeResponse = await fetch('https://formspree.io/f/mykyerpd', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'Accept': 'application/json'
                    }
                });

                if (!formspreeResponse.ok) {
                    throw new Error('Erreur Formspree');
                }

                // 2. Envoyer confirmation au client via EmailJS
                await emailjs.send('service_z33smap', 'template_k7a2kek', emailParams);

                // Succès
                showNotification(t.successTitle, t.successMsg);
                this.reset();
                document.getElementById('nombreEnfants').style.display = 'none';

            } catch (error) {
                console.error('Erreur:', error);
                showNotification(t.errorTitle, t.errorMsg, true);
            } finally {
                submitBtn.disabled = false;
                submitBtn.textContent = originalText;
            }
        });

        // ========== FORMULAIRE DE COMMENTAIRE ==========
        document.getElementById('commentForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const commentText = document.getElementById('commentText').value;
            if (!commentText.trim()) return;
            
            setTimeout(() => {
                showNotification(
                    currentLang === 'fr' ? 'Commentaire publié !' : 
                    currentLang === 'en' ? 'Comment published!' : 'تم نشر التعليق!',
                    currentLang === 'fr' ? 'Votre commentaire a été publié.' : 
                    currentLang === 'en' ? 'Your comment has been published.' : 'تم نشر تعليقك.'
                );
                this.reset();
            }, 1000);
        });

        // ========== SCROLL SMOOTH ==========
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const targetId = this.getAttribute('href');
                if (targetId.length > 1) {
                    e.preventDefault();
                    const target = document.querySelector(targetId);
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth'
                        });
                    }
                }
            });
        });
    </script>
</body>
</html>
