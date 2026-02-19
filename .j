index.html
<!DOCTYPE html> <html lang="de"> <head> <meta charset="UTF-8" /> <meta name="viewport" content="width=device-width, initial-scale=1.0"/> <title>SportKraft – Sportbekleidung</title> <link rel="stylesheet" href="style.css" /> </head> <body> <header> <div class="logo">SportKraft</div> <nav> <a href="#home">Home</a> <a href="#produkte">Produkte</a> <a href="#about">Über uns</a> <a href="#kontakt">Kontakt</a> </nav> <div class="korb" id="korbBtn" title="Warenkorb">🧺 <span id="korbCount">0</span></div> </header> <section id="home" class="hero"> <h1>Leistungsstarke Sportbekleidung für jeden Tag</h1> <p>Atmungsaktiv, langlebig und bequem – für Training, Freizeit und Wettkampf.</p> <button onclick="navigateTo('produkte')">Produkte entdecken</button> </section> <section id="produkte" class="container"> <h2>Unsere Produkte</h2> <div id="produktGrid" class="grid"></div> </section> <section id="about" class="container"> <h2>Über SportKraft</h2> <p>Wir setzen auf hochwertige Materialien, faire Produktion und nachhaltiges Design.</p> </section> <section id="kontakt" class="container"> <h2>Kontakt</h2> <form id="kontaktForm"> <label>Name<input type="text" required></label> <label>Email<input type="email" required></label> <label>Nachricht<textarea required></textarea></label> <button type="submit">Senden</button> </form> </section> <footer class="container"> <p>&copy; 2026 SportKraft. Alle Rechte vorbehalten.</p> </footer> <script src="script.js"></script> </body> </html>
style.css
:root{
--prim: #1e3a8a; /* dunkelblau /
--accent: #10b981; / grün */
--bg: #f5f7fb;
--card: #fff;
}
*{box-sizing:border-box}
body{margin:0;font-family:Inter, system-ui, Arial, sans-serif;background:var(--bg);color:#111}
header{display:flex;justify-content:space-between;align-items:center;padding:16px 24px;background:#fff;position:sticky;top:0;box-shadow:0 2px 6px rgba(0,0,0,.05);z-index:10}
header .logo{font-weight:800;font-size:1.25rem;color:var(--prim)}
nav{gap:16px;display:flex}
nav a{text-decoration:none;color:#333}
.korb{cursor:pointer;display:flex;gap:6px;align-items:center;background:#f0f2f5;padding:8px 12px;border-radius:999px}
.container{max-width:1100px;margin:0 auto;padding:40px 20px}
.hero{padding:60px 20px;text-align:center;background:linear-gradient(135deg,#e8f0fe 0%, #fff 60%);min-height:40vh;display:flex;flex-direction:column;justify-content:center;gap:16px}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(240px,1fr));gap:20px}
.card{background:var(--card);border-radius:12px;padding:16px;box-shadow:0 2px 6px rgba(0,0,0,.05)}
.card img{width:100%;height:180px;object-fit:cover;border-radius:8px}
.card h3{margin:8px 0 6px}
.card p{margin:0 0 12px;color:#555}
.btn{padding:10px 12px;border:none;border-radius:8px;background:var(--prim);color:#fff;cursor:pointer}
.btn.secondary{background:#fff;color:var(--prim);border:1px solid var(--prim)}
.kaufe{display:flex;gap:8px;justify-content:space-between;align-items:center}
@media (max-width:600px){
header{flex-wrap:wrap;gap:8px}
nav{display:none}
}

script.js
// Musterprodukte
const produkte = [
{ id: 1, name: "Aktiv Hoodie", price: 59.99, image: "https://images.unsplash.com/photo-1524641963749-9be3a1947e14?q=80&w=600&auto=format&fit=crop", description: "Weiches Fleece, bequemer Schnitt." },
{ id: 2, name: "Performance T-Shirt", price: 29.99, image: "https://images.unsplash.com/photo-1520975918650-8f8f9b3a3a54?q=80&w=600&auto=format&fit=crop", description: "Atmungsaktiv, feuchtigkeitsableitend." },
{ id: 3, name: "Run-Jacke Light", price: 89.99, image: "https://images.unsplash.com/photo-1528444258093-6e9a9e2c6a3f?q=80&w=600&auto=format&fit=crop", description: "Winddicht, ultraleicht." },
{ id: 4, name: "Kurze Trainingshose", price: 34.99, image: "https://images.unsplash.com/photo-1604007250836-4f2dff0b3a4b?q=80&w=600&auto=format&fit=crop", description: "Elastischer Bund, seitliche Taschen." }
];

let warenkorb = [];

function renderProdukte(){
const grid = document.getElementById('produktGrid');
grid.innerHTML = '';
produkte.forEach(p => {
const card = document.createElement('div');
card.className = 'card';
card.innerHTML =       <img src="${p.image}" alt="${p.name}">       <h3>${p.name}</h3>       <p>${p.description}</p>       <div class="kaufe">         <span>${p.price.toFixed(2)} €</span>         <button class="btn" onclick="hinzufuegen(${p.id})">In den Warenkorb</button>       </div>    ;
grid.appendChild(card);
});
}

function hinzufuegen(id){
const produkt = produkte.find(p => p.id === id);
if(!produkt) return;
const exist = warenkorb.find(i => i.id === id);
if(exist){
exist.qty += 1;
} else {
warenkorb.push({id: produkt.id, name: produkt.name, price: produkt.price, qty: 1});
}
aktualisiereKorbAnzeige();
alert(${produkt.name} zum Warenkorb hinzugefügt);
}

function aktualisiereKorbAnzeige(){
const count = warenkorb.reduce((sum, it) => sum + it.qty, 0);
document.getElementById('korbCount').textContent = count;
}

function navigateTo(sectionId){
document.getElementById(sectionId).scrollIntoView({behavior:'smooth'});
}

document.getElementById('kontaktForm').addEventListener('submit', function(e){
e.preventDefault();
alert('Danke für deine Nachricht! Wir melden uns bald.');
this.reset();
});

// Initialisieren
renderProdukte();
aktualisiereKorbAnzeige();
