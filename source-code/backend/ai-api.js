import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: "AIzaSyB2S1HUAIgxoWAUJzlGLhgp746jEYwdA6o" });

async function main(contant) {
  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: contant,
  });
  console.log(response.text);
}

main("tell me about egypt");