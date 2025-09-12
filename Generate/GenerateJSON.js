// Generates a JSON-formatted ppi:machineName dictionary
// Usage: deno -R GenerateSwift.js > DevicePpi.json

import { parse } from "jsr:@std/yaml";
const text = await Deno.readTextFile("./DevicePpi.yaml");
const data = parse(text);
const lines = [];
for (const group of Object.values(data)) {
    for (const [ppi, devices] of Object.entries(group)) {
        for (const device of Object.values(devices)) {
            for (const [name, ids] of Object.entries(device)) {
                for (const id of Object.values(ids)) {
                    lines.push(`"${id}":${ppi}`);
                }
            }
        }
    }
}
const jsonString = `\{${ lines.join(",\n ") }\}`
console.log(jsonString);