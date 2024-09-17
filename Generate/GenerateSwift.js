// Generates a Swift-formatted machineName:ppi dictionary

import { parse } from "jsr:@std/yaml";
const text = await Deno.readTextFile("./DevicePpi.yaml");
const data = parse(text);
const lines = [];
for (const group of Object.values(data)) {
    for (const [ppi, ids] of Object.entries(group)) {
        for (const id of Object.values(ids)) {
            lines.push(`        "${id}": ${ppi}`);
        }
    }
}
const string = `// Generated from DevicePpi.yaml
let machineNameToPpi : [String : Double] =
    [
${ lines.join(",\n") }
    ]`;
console.log(string);