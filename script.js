// 1. BARRA DE CARGA AL HACER SCROLL (Línea superior)
window.addEventListener('scroll', () => {
    const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    const scrolled = (winScroll / height) * 100;
    document.getElementById('progress-bar').style.width = scrolled + '%';
});

// 2. CUESTIONARIO DESPLEGABLE CON EFECTO ACTIVO
const faqQuestions = document.querySelectorAll('.faq-question');
faqQuestions.forEach(question => {
    question.addEventListener('click', () => {
        const faqItem = question.parentElement;
        
        // Cierra los otros paneles abiertos
        document.querySelectorAll('.faq-item').forEach(item => {
            if (item !== faqItem) item.classList.remove('active');
        });

        faqItem.classList.toggle('active');
    });
});

// 3. ANIMACIÓN Y RASTRO MORADO CON LA FLECHITA
document.addEventListener('mousemove', (e) => {
    createTrail(e.clientX, e.clientY);
});

function createTrail(x, y) {
    const trail = document.createElement('div');
    trail.className = 'trail-particle';
    trail.style.left = x + 'px';
    trail.style.top = y + 'px';

    document.body.appendChild(trail);

    setTimeout(() => {
        trail.style.opacity = '0';
        trail.style.transform = 'translate(-50%, -50%) scale(0.1)';
    }, 50);

    setTimeout(() => {
        trail.remove();
    }, 350);
}