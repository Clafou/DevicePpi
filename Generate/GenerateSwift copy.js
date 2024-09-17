// Generates a Swift-formatted ppi:machineName dictionary

import { parse } from "jsr:@std/yaml";
const text = await Deno.readTextFile("./DevicePpi.yaml");
const data = parse(text);
const sections = [];
for (const group of Object.values(data)) {
    for (const [ppi, ids] of Object.entries(group)) {
        const lines = [];
        for (const id of Object.values(ids)) {
            lines.push(`                "${id}"`);
        }
        sections.push(`        ${ppi}:
            [
${ lines.join(",\n") }
            ]`);
    }
}
const string = `// Generated from DevicePpi.yaml
let ppiToMachineNames : [Double : [String]] =
    [
${ sections.join(",\n") }
    ]`;
console.log(string);