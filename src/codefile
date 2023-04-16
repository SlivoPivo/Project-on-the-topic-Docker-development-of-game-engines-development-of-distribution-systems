//npm install clipboardy, mathjs

import fs from 'fs'
import clipboardy from 'clipboardy'
import { evaluate } from 'mathjs'

let path = "C:/Users/treys/AppData/Roaming/MythicalLauncher/updates/TechnoMagic-1.12.2/logs/latest.log"

let key_word = "[main/INFO]: [CHAT] = ="

let log_text_arr
let element, element_prev, answer
let math_index, math_stop_index, math

fs.watchFile(path, { persistent: true, interval: 500 }, () => {
    fs.readFile(path, (err, data) => {
        if (err) throw err

        processFile(data)

    })
})

function processFile(data) {

    log_text_arr = data.toString().split("\n")
    log_text_arr.reverse()

    element = log_text_arr.find((element) => element.indexOf(key_word) != -1)

    if (element == element_prev) return
    if (element === undefined) return

    math_index = element.indexOf('�: ') + 3
    math_stop_index = element.indexOf('�����,') - 2
    console.log(element)

    math = element.slice(math_index, math_stop_index)

    console.log(math)
    console.log(evaluate(math))

    answer = evaluate(math)

    clipboardy.writeSync(answer.toString());
    clipboardy.readSync();

    element_prev = element

    // let uint8Array = new Uint8Array(data);
    // let log_text = decoder.decode(uint8Array)

}
