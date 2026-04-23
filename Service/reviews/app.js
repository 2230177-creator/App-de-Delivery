const express = require('express');
const app = express();
app.use(express.json());

let reviews = []; // Base de datos temporal

app.get('/health', (req, res) => res.status(200).send('Servicio saludable'));

app.post('/reviews', (req, res) => {
    const review = req.body;
    reviews.push(review);
    res.status(201).send({ message: "Reseña creada", review });
});

app.get('/reviews', (req, res) => res.json(reviews));

const PORT = 3000;
app.listen(PORT, () => console.log(`Servicio corriendo en puerto ${PORT}`));