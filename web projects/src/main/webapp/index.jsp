<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = 'model.User' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Sri Drive</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

    <%
        User user = (User)session.getAttribute("user");
    %>
    
    <%@include file = 'header.jsp' %>
    
<style>
    :root {
        --primary: #4361ee;
        --primary-dark: #3a56d4;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1a1a2e;
        --light: #f8f9fa;
        --success: #4cc9f0;
        --warning: #f72585;
    }
    
    body {
        font-family: 'Outfit', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        margin: 0;
        padding: 0;
        background-color: var(--light);
        color: var(--dark);
        line-height: 1.6;
    }

    .hero {
        background: linear-gradient(135deg, #4361ee 0%, #3a56d4 40%, #2d44a8 100%);
        background-size: cover;
        background-position: center;
        min-height: 90vh;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        color: white;
        padding: 12px 24px 80px;
        clip-path: polygon(0 0, 100% 0, 100% 92%, 0 100%);
        margin-bottom: -4%;
        position: relative;
        overflow: hidden;
    }

    .hero::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: radial-gradient(ellipse 80% 50% at 50% -20%, rgba(255,255,255,0.15) 0%, transparent 50%),
                    radial-gradient(circle at 90% 80%, rgba(72, 149, 239, 0.3) 0%, transparent 40%);
        pointer-events: none;
    }

    .hero-content {
        position: relative;
        z-index: 1;
        max-width: 900px;
    }

    .hero-content h1 {
        font-size: clamp(2.2rem, 5vw, 3.8rem);
        margin-bottom: 24px;
        animation: fadeInDown 0.9s ease 0.1s both;
        font-weight: 800;
        line-height: 1.15;
        letter-spacing: -0.02em;
        text-shadow: 0 2px 30px rgba(0,0,0,0.15);
    }

    .hero-content     .hero-desc {
        font-size: 1.2rem;
        line-height: 1.75;
        margin-bottom: 36px;
        max-width: 640px;
        margin-left: auto;
        margin-right: auto;
        animation: fadeIn 1s ease 0.2s both;
        opacity: 0.95;
        font-weight: 600;
        letter-spacing: 0.01em;
    }

    .btn {
        display: inline-block;
        padding: 14px 32px;
        background: var(--primary);
        color: white;
        text-decoration: none;
        border-radius: 50px;
        font-weight: 600;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        margin: 0 10px;
        animation: fadeInUp 1s ease 0.3s both;
        border: none;
        cursor: pointer;
        font-size: 1rem;
        letter-spacing: 0.02em;
        box-shadow: 0 4px 20px rgba(0,0,0,0.15);
    }

    .btn-primary {
        background: white;
        color: var(--primary);
    }

    .btn-secondary {
        background: transparent;
        border: 2px solid white;
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .btn-primary:hover {
        background: rgba(255,255,255,0.9);
    }

    .btn-secondary:hover {
        background: rgba(255,255,255,0.1);
    }

    .services {
        padding: 120px 20px 80px;
        text-align: center;
        background: white;
        position: relative;
        z-index: 1;
    }

    .section-title {
        font-size: 2.5rem;
        margin-bottom: 50px;
        color: var(--dark);
        position: relative;
        font-weight: 700;
    }

    .section-title:after {
        content: '';
        display: block;
        width: 80px;
        height: 4px;
        background: var(--primary);
        margin: 15px auto 0;
    }

    .services-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .service-card {
        background: white;
        border-radius: 15px;
        padding: 40px 30px;
        box-shadow: 0 5px 25px rgba(67, 97, 238, 0.1);
        transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        border: 1px solid rgba(67, 97, 238, 0.1);
        text-align: center;
    }

    .service-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(67, 97, 238, 0.15);
    }

    .service-icon {
        font-size: 3.5rem;
        color: var(--primary);
        margin-bottom: 25px;
        display: inline-block;
        background: rgba(67, 97, 238, 0.1);
        width: 90px;
        height: 90px;
        line-height: 90px;
        border-radius: 50%;
        text-align: center;
    }

    .service-card h3 {
        font-size: 1.5rem;
        margin-bottom: 15px;
        color: var(--dark);
        font-weight: 600;
    }

    .service-card p {
        color: #666;
        font-size: 1rem;
    }

    .about {
        padding: 100px 20px;
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        text-align: center;
        clip-path: polygon(0 10%, 100% 0, 100% 90%, 0 100%);
        margin: -5% 0;
        position: relative;
        z-index: 0;
    }

    .about-content {
        max-width: 800px;
        margin: 0 auto;
        line-height: 1.8;
        font-size: 1.1rem;
    }

    .about-content p {
        margin-bottom: 25px;
    }

    .stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 25px;
        max-width: 1000px;
        margin: 60px auto 0;
    }

    .stat-item {
        background: white;
        padding: 35px 25px;
        border-radius: 15px;
        box-shadow: 0 5px 25px rgba(67, 97, 238, 0.1);
        transition: transform 0.3s ease;
    }

    .stat-item:hover {
        transform: scale(1.05);
    }

    .stat-number {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--primary);
        margin-bottom: 10px;
    }

    /* New Features Section */
    .features {
        padding: 120px 20px;
        background: white;
        text-align: center;
    }
    
    .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 40px;
        max-width: 1200px;
        margin: 50px auto 0;
        text-align: left;
    }
    
    .feature-card {
        display: flex;
        gap: 20px;
    }
    
    .feature-icon {
        font-size: 2rem;
        color: var(--primary);
        flex-shrink: 0;
        margin-top: 5px;
    }
    
    .feature-content h3 {
        font-size: 1.3rem;
        margin-bottom: 10px;
        color: var(--dark);
    }
    
    /* Testimonials */
    .testimonials {
        padding: 100px 20px;
        background: linear-gradient(135deg, #4361ee 0%, #3a56d4 100%);
        color: white;
        text-align: center;
        clip-path: polygon(0 10%, 100% 0, 100% 100%, 0 90%);
        margin-top: -5%;
    }
    
    .testimonials .section-title {
        color: white;
    }
    
    .testimonials .section-title:after {
        background: white;
    }
    
    .testimonial-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 50px auto 0;
    }
    
    .testimonial-card {
        background: rgba(255,255,255,0.1);
        padding: 30px;
        border-radius: 15px;
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255,255,255,0.2);
    }
    
    .testimonial-text {
        font-style: italic;
        margin-bottom: 20px;
        position: relative;
    }
    
    .testimonial-text:before {
        content: '"';
        font-size: 3rem;
        color: rgba(255,255,255,0.2);
        position: absolute;
        left: -15px;
        top: -20px;
    }
    
    .testimonial-author {
        font-weight: 600;
    }
    
    /* CTA Section */
    .cta {
        padding: 100px 20px;
        background: white;
        text-align: center;
    }
    
    .cta-content {
        max-width: 700px;
        margin: 0 auto;
    }
    
    .cta-buttons {
        margin-top: 40px;
    }

    footer {
        background: var(--dark);
        color: white;
        text-align: center;
        padding: 60px 20px 30px;
        margin-top: 0;
    }
    
    .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 40px;
        text-align: left;
        margin-bottom: 40px;
    }
    
    .footer-column h3 {
        font-size: 1.2rem;
        margin-bottom: 20px;
        color: var(--accent);
    }
    
    .footer-column ul {
        list-style: none;
        padding: 0;
    }
    
    .footer-column ul li {
        margin-bottom: 10px;
    }
    
    .footer-column ul li a {
        color: rgba(255,255,255,0.7);
        text-decoration: none;
        transition: color 0.3s;
    }
    
    .footer-column ul li a:hover {
        color: white;
    }

    .app-badge {
        display: inline-block;
        padding: 10px 18px;
        background: rgba(255,255,255,0.1);
        color: white;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.9rem;
        border: 1px solid rgba(255,255,255,0.2);
        transition: all 0.3s ease;
    }

    .app-badge:hover {
        background: rgba(255,255,255,0.2);
        color: white;
    }
    
    .footer-bottom {
        border-top: 1px solid rgba(255,255,255,0.1);
        padding-top: 30px;
        margin-top: 30px;
    }
    
    .social-links {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
    }
    
    .social-links a {
        color: white;
        font-size: 1.5rem;
        transition: color 0.3s;
    }
    
    .social-links a:hover {
        color: var(--accent);
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 768px) {
        .hero {
            height: auto;
            padding: 100px 20px;
            clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
        }
        
        .hero-content h1 {
            font-size: 2rem;
        }

        .hero-desc {
            font-size: 1.05rem !important;
        }
        
        .btn {
            display: block;
            margin: 15px auto;
            max-width: 250px;
        }
        
        .about, .testimonials {
            clip-path: none;
            margin: 0;
            padding: 80px 20px;
        }
    }
</style>

    <div class="hero">
        <div class="hero-content">
            <h1>Revolutionizing Vehicle Care with Smart Technology</h1>
            <p class="hero-desc">Sri Drive offers a seamless digital experience for all your vehicle needs—from scheduled maintenance to emergency services and fuel delivery—all at your fingertips.</p>
            <% if(user == null) { %>
                <a href="login.jsp" class="btn btn-primary">Sign In</a>
                <a href="register.jsp" class="btn btn-secondary">Register Now</a>
            <% } else { %>
                <a href="cus_get_stations" class="btn btn-primary">Book Service</a>
                <a href="customer_get_vehicle" class="btn btn-secondary">My Profile</a>
            <% } %>
        </div>
    </div>

    <section class="services">
        <h2 class="section-title">Our Comprehensive Services</h2>
        <div class="services-grid">
            <div class="service-card">
                <div class="service-icon">🔧</div>
                <h3>Premium Vehicle Servicing</h3>
                <p>From routine oil changes to complex engine diagnostics, our certified technicians provide top-tier service using state-of-the-art equipment.</p>
            </div>
            <div class="service-card">
                <div class="service-icon">⛽</div>
                <h3>On-Demand Fuel Delivery</h3>
                <p>Never run on empty again. Order fuel through our app and have it delivered to your home, office, or roadside location.</p>
            </div>
            <div class="service-card">
                <div class="service-icon">🚗</div>
                <h3>Fleet Management</h3>
                <p>Manage multiple vehicles with ease. Track service history, fuel consumption, and maintenance schedules in one dashboard.</p>
            </div>
        </div>
    </section>

    <section class="about">
        <h2 class="section-title">Why Choose AutoCare Pro?</h2>
        <div class="about-content">
            <p>Sri Drive is transforming the automotive service industry by combining cutting-edge technology with trusted mechanical expertise. Our platform bridges the gap between vehicle owners and professional service providers, ensuring transparency, convenience, and quality.</p>
            <p>With real-time tracking, digital service records, and predictive maintenance alerts, we're making vehicle ownership simpler and more cost-effective than ever before.</p>
        </div>
        
        <div class="stats">
            <div class="stat-item">
                <div class="stat-number">10,000+</div>
                <div>Satisfied Customers</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">200+</div>
                <div>Certified Service Centers</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">45 min</div>
                <div>Average Response Time</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">24/7</div>
                <div>Roadside Assistance</div>
            </div>
        </div>
    </section>
    
    <section class="features">
        <h2 class="section-title">Key Features</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">📱</div>
                <div class="feature-content">
                    <h3>Mobile-First Platform</h3>
                    <p>Book services, track progress, and make payments directly from your smartphone with our intuitive mobile interface.</p>
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <div class="feature-content">
                    <h3>Digital Service History</h3>
                    <p>Maintain complete records of all services, parts replaced, and maintenance performed on your vehicle in one secure location.</p>
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">⏱️</div>
                <div class="feature-content">
                    <h3>Real-Time Tracking</h3>
                    <p>Monitor your vehicle's service status in real-time and receive notifications at each stage of the process.</p>
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💰</div>
                <div class="feature-content">
                    <h3>Transparent Pricing</h3>
                    <p>No hidden fees. Get upfront quotes and detailed breakdowns of all service costs before approval.</p>
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🛡️</div>
                <div class="feature-content">
                    <h3>Warranty Protection</h3>
                    <p>All services come with our satisfaction guarantee and warranty on parts and labor.</p>
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🔍</div>
                <div class="feature-content">
                    <h3>Vehicle Diagnostics</h3>
                    <p>Advanced diagnostic tools help identify potential issues before they become major problems.</p>
                </div>
            </div>
        </div>
    </section>
    
    <section class="testimonials">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="testimonial-grid">
            <div class="testimonial-card">
                <div class="testimonial-text">
                    Sri Drive saved me when I ran out of fuel on the highway. Their emergency fuel delivery arrived in under 30 minutes!
                </div>
                <div class="testimonial-author">- Sarah J., Regular Customer</div>
            </div>
            <div class="testimonial-card">
                <div class="testimonial-text">
                    Managing our company fleet has never been easier. The dashboard gives us complete visibility into maintenance schedules and costs.
                </div>
                <div class="testimonial-author">- Michael T., Fleet Manager</div>
            </div>
            <div class="testimonial-card">
                <div class="testimonial-text">
                    The transparency in pricing and quality of service keeps me coming back. I know exactly what I'm paying for.
                </div>
                <div class="testimonial-author">- Priya K., Premium Member</div>
            </div>
        </div>
    </section>
    
    <section class="cta">
        <div class="cta-content">
            <h2 class="section-title">Ready to Experience Smarter Vehicle Care?</h2>
            <p>Join thousands of satisfied customers who are enjoying hassle-free vehicle maintenance and fuel services.</p>
            <div class="cta-buttons">
                <% if(user == null) { %>
                    <a href="register.jsp" class="btn btn-primary">Get Started Now</a>
                <% } else { %>
                    <a href="cus_get_stations" class="btn btn-primary">Book Your Next Service</a>
                <% } %>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <div class="footer-column">
                <h3>Services</h3>
                <ul>
                    <li><a href="#">Vehicle Servicing</a></li>
                    <li><a href="#">Fuel Delivery</a></li>
                    <li><a href="#">Emergency Assistance</a></li>
                    <li><a href="#">Fleet Management</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Company</h3>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Press</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Support</h3>
                <ul>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Download Our App</h3>
                <p>Get the full Sri Drive experience on your mobile device.</p>
                <div style="margin-top: 15px; display: flex; gap: 10px; flex-wrap: wrap;">
                    <a href="#" class="app-badge">App Store</a>
                    <a href="#" class="app-badge">Google Play</a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2023 AutoCare Pro. All rights reserved.</p>
            <div class="social-links">
                <a href="#">📱</a>
                <a href="#">💻</a>
                <a href="#">📘</a>
                <a href="#">🐦</a>
                <a href="#">📸</a>
            </div>
        </div>
    </footer>

</body>
</html>