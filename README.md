# Japanese-English-Text-Processor

This repository contains scripts that work with `japanese_text.txt` and `english_text.txt`, along with a GUI (`Jap_GUI.ahk`) to facilitate the process.

## Prerequisites

To work with these scripts, make sure you have AutoHotkey installed on your system. If you haven't, you can download it from [here](https://www.autohotkey.com/).

## Setup

1. Clone the repository.
2. Copy the following files from this repository into your Scripts Folder:

   - `japanese_text.txt`
   - `english_text.txt`
   - `Jap_GUI.ahk`
   
## Running the script

Utilize the Run command to run the script. Here's an example of how you can do it:

```autohotkey
RunWait, Jap_GUI.ahk
```

This will execute `Jap_GUI.ahk` and wait for it to finish before continuing.

## Indefinite Execution

To have the script run indefinitely, change the correct condition in the `CheckAnswer:` routine from `Exitapp:` to the following code:

```autohotkey
OutputReset()
GenorateGUI()
SoundBeep, 100
return
```

This modification will reset the output, regenerate the GUI, and then produce a beep sound with a frequency of 100Hz every time the script cycles through.

## Contributions

Feel free to contribute to this repository.

## License

[Creative Commons Zero v1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)
