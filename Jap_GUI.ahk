#SingleInstance force
#Persistent
#NoEnv


global CorrectAnswer := "111"
global Outfirst_number := "222"
global Outsecond_number := "333"
global OutputSign := "Sign Error"


OutputReset()
GenorateGUI()
SoundBeep, 100
return


~NumpadEnter::
~Enter::
if WinActive("Question") {
Gui, Submit, NoHide
UserAnswer := Trim(UserAnswer)

	if (UserAnswer = "") {
		SoundBeep, 100
	}
	else {
		Goto CheckAnswer
	}
}
else {

}
return

;Checks user answer to store answer in "english_text.txt" and basic arithmetic 
CheckAnswer:
{
    Gui, Submit, NoHide
    answer := UserAnswer

    if (answer = CorrectAnswer) {
		SoundBeep, 100
		ExitApp
    }
    else {
        ToolTip % "Wrong answer. The correct answer is " CorrectAnswer ".`n Your answer was : "UserAnswer " Or " answer
		OutputReset()
		GenorateGUI()
		SoundBeep
    }
    return
}
return

;Main function
GetRandomQuestion(Type) {
	OutputReset()
	if (Type = 0) {
		Random, RType, 0, 1
	}
	else {
		RType := 0
	}

	if (RType = 0) {
		Random, Sign, 0, 3
		CheckMath(Sign, GenRandomNumbers(0, 20), GenRandomNumbers(0, 20))
		BigQuestion := ReadFile(Outfirst_number, 0) " " OutputSign " " ReadFile(Outsecond_number, 0) " = ?"
	} else if (RType = 1) {
		BigQuestion := "What Does " CheckWord() " Mean?"
	}
    return BigQuestion
}
return

;Genorates and Checks the Word
CheckWord() {
	Random, RandomWord, 22, 92
	SelectedWord := ReadFile(RandomWord, 2)
	CorrectAnswer := ReadFile(RandomWord, 3)
	ToolTip, %CorrectAnswer%, 0, A_ScreenHeight // 2
	Gui, Font, s16.5
	return SelectedWord
}
return

;Genorates and Checks the Number
CheckMath(Sign, first_number, second_number) {
    Outfirst_number := first_number
    Outsecond_number := second_number
    resultValid := false

    if (Sign = 1) {
        OutputSign := "X"
        result := first_number * second_number
    } else if (Sign = 2) {
        OutputSign := "-"
        result := first_number - second_number
    } else if (Sign = 3) {
        OutputSign := "+"
        result := first_number + second_number
    } else {
        OutputSign := "%"
        result := first_number // second_number
    }

    if (result >= 0 && result <= 20) {
        if (Sign != 0 || Mod(first_number, second_number) = 0) {
            CorrectAnswer := result
            resultValid := true
        }
    }

    if (!resultValid) {
        GetRandomQuestion(1)
    } else {
        ToolTip, %CorrectAnswer%, 0, A_ScreenHeight // 2 ;ToolTip, %Outfirst_number% %OutputSign% %Outsecond_number% Is %CorrectAnswer%
    }

    return
}
return

;Genorates random Number
GenRandomNumbers(min, max) {
	Random, randomNumber, min, max
	return randomNumber
}
return

;Reads the Files and returns the type in word form
ReadFile(randomnum, type){
    num := randomnum + 1
    lang := type ? type : Random(2, 3)
    filename := lang = 2 ? "japanese_text.txt" : "english_text.txt"
    FileReadLine, Word, %filename%, num
    return Word
}
return
Random(min, max) {
    Random, result, min, max
    return result
}
return

;Reset Errors
OutputReset() {
CorrectAnswer := "Answer Error"
Outfirst_number := "First Error"
Outsecond_number := "Second Error"
OutputSign := "Sign Error"
}

;Genorates the GUI
GenorateGUI()
{
Gui, Destroy
Gui, Font, s15
Gui, Add, Text, x40, % GetRandomQuestion(0)
Gui, Add, Edit, x40 y60 w220 vUserAnswer
Gui, Show, w300 h120, Question
}
return

9::
Esc::
ExitApp




