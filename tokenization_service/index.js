import express from 'express';
import cors from 'cors';

import {AutoTokenizer} from '@xenova/transformers';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

let tokenizer = null;

async function bootstrap() {
    // Start listening
    await new Promise((resolve) =>
        app.listen(PORT, '0.0.0.0', () => {
            console.log(`🚀 Server listening on http://0.0.0.0:${PORT}`);
            resolve();
        })
    );
    tokenizer = await AutoTokenizer.from_pretrained('Xenova/t5-base');
    console.log('✅ Tokenizer loaded');
}

// Kick off the service
bootstrap().catch(err => {
    console.error('Failed to start tokenizer service:', err);
    process.exit(1);
});

app.post('/encode', (req, res) => {
    if (!tokenizer) {
        return res.status(503).json({ error: 'Tokenizer not loaded yet' });
    }
    const { text } = req.body;
    let inputIds = tokenizer.encode(text);
    const attentionMask = inputIds.map(() => 1);
    res.json({ input_ids: inputIds, attention_mask: attentionMask });
});

app.post('/decode', (req, res) => {
    if (!tokenizer) {
        return res.status(503).json({ error: 'Tokenizer not loaded yet' });
    }
    const { ids } = req.body;

    // 1. Decode without cleaning up spaces
    let text = tokenizer.decode(ids, {
        skip_special_tokens: true,
        clean_up_tokenization_spaces: false
    });

    // 2. Replace SentencePiece meta‐spaces with real spaces
    text = text.replace(/▁/g, ' ').trim();

    res.json({ text });
});
