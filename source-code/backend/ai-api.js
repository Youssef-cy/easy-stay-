import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: "AIzaSyCrPB7sAaffQsSJ6C0RSJPsuODvG4aKAKc" });

async function main(contant) {
  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: contant,
  });
  console.log(response.text);
}

main("");