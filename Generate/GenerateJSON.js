// Generates a JSON-formatted ppi:machineName dictionary

import { parse } from "jsr:@std/yaml";
const text = await Deno.readTextFile("./DevicePpi.yaml");
const data = parse(text);
const lines = [];
for (const group of Object.values(data)) {
    for (const [ppi, ids] of Object.entries(group)) {
        for (const id of Object.values(ids)) {
            lines.push(`"${id}":${ppi}`);
        }
    }
}
const jsonString = `\{${ lines.join(",\n ") }\}`
console.log(jsonString);