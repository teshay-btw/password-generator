import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Window {
    visible: true
    width: 1080
    height: 730
    minimumHeight: 730
    maximumHeight: 730
    minimumWidth: 1080
    maximumWidth: 1080
    title: "Password Generator"
    FontLoader {
        id: customfont
        source: "ZalandoSansExpanded-Bold.ttf"
    }
    Row {
        spacing: 50
        Column {
        
            spacing: 20


            Row {
                objectName: "row_password_length"
                id: row_password_length
                visible: true
                Text {
                    topPadding: 20
                    leftPadding: 20
                    font.pointSize: 15
                    font.letterSpacing: 1
                    text: "Password Length: "
                    width: 450

                }
            
                TextField {
                    Layout.fillWidth: true
                    id: userinput_password_length
                    objectName: "userinput_password_length"
                    padding: 20
                    y: 15
                    font.pointSize: 12
                    font.letterSpacing: 1
                    font.bold: true
                    color: "black"
                    focus: true
                    onActiveFocusChanged: {
                        userinput_pass_length_background.border.color = "black"
                    }
                    background: Rectangle {
                        id: userinput_pass_length_background
                        objectName: "userinput_background"
                        implicitWidth: 110
                        implicitHeight: 40
                        color: "white"
                        border.color: "black"
                        border.width: 2
                    
                    }

                
                   
                }

            }


            Row {
                objectName: "row_minimum_password_length"
                visible: false
                id: row_minimum_password_length
                Text {
                    topPadding: 20
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Minimum password length:"
                    width: 450
                    font.letterSpacing: 1
                }
            
                TextField {
                    Layout.fillWidth: true
                    id: userinput_minimum_password_length
                    objectName: "userinput_minimum_password_length"
                    padding: 20
                    y: 10
                    font.pointSize: 12
                    font.letterSpacing: 1
                    font.bold: true
                    color: "black"
                    focus: true
                    onActiveFocusChanged: {
                        userinput_minimum_password_length_background.border.color = "black"
                    }
                    background: Rectangle {
                        id: userinput_minimum_password_length_background
                        objectName: "userinput_background"
                        implicitWidth: 110
                        implicitHeight: 40
                        color: "white"
                        border.color: "black"
                        border.width: 2
                    }  
                }

            }
            Row {
                objectName: "row_maximum_password_length"
                visible: false
                id: row_maximum_password_length
                Text {
                    topPadding: 20
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Maximum password length:"
                    width: 450
                    font.letterSpacing: 1
                }
            
                TextField {
                
                    Layout.fillWidth: true
                    id: userinput_maximum_password_length
                    objectName: "userinput_maximum_password_length"
                    y: 10
                    padding: 20
                    font.pointSize: 12
                    font.letterSpacing: 1
                    font.bold: true
                    color: "black"
                    focus: true
                    onActiveFocusChanged: {
                        userinput_maximum_password_length_background.border.color = "black"
                    }
                    background: Rectangle {
                        id: userinput_maximum_password_length_background
                        objectName: "userinput_background"
                        implicitWidth: 110
                        implicitHeight: 40
                        color: "white"
                        border.color: "black"
                        border.width: 2
                    }  
                }

            } 
    
            Row {
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    topPadding: 10
                    text: "Include Special Characters:"
                    width: 450
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: symbols_cb
                    checked: false
                    y: 15
                    width: 20
                    height: 20
                    onCheckedChanged: {
                        backend.enable_symbols(checked)
                        error_selected_none.visible = false
                    }
                    background: Rectangle {
                        color: symbols_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: symbols_cb.checked ? "black" : "black"
                        color: symbols_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: symbols_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
                

                
                
                }
                Text {
                    font.pointSize: 12
                    topPadding: 13
                    leftPadding: 10
                    text: "(e.g. %@#$)"
                    font.letterSpacing: 1
                }

            }
            Row {
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Include Numbers:"
                    width: 450
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: numbers_cb
                    checked: false
                    y: 6
                    width: 20
                    height: 20
                    onCheckedChanged: {
                        backend.enable_numbers(checked)
                        error_selected_none.visible = false
                    }
                    background: Rectangle {
                        color: numbers_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: numbers_cb.checked ? "black" : "black"
                        color: numbers_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: numbers_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
                Text {
                    font.pointSize: 12
                    topPadding: 3
                    leftPadding: 10
                    text: "(e.g. 12345)"
                    font.letterSpacing: 1
                }
            }
            Row {
                Text {
                    width: 450
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Include Lowercase Characters:"
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: lowercase_cb
                    checked: false
                    width: 20
                    height: 20
                    y: 6
                    onCheckedChanged: {
                        backend.enable_lowercase(checked)
                        error_selected_none.visible = false
                    }
                    background: Rectangle {
                        color: lowercase_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: lowercase_cb.checked ? "black" : "black"
                        color: lowercase_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: lowercase_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
                Text {
                    font.pointSize: 12
                    topPadding: 3
                    leftPadding: 10
                    text: "(e.g. abcdefg)"
                    font.letterSpacing: 1
                }
            }
            Row {
                Text {
                    width: 450
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Include Uppercase Characters:"
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: uppercase_cb
                    checked: false
                    width: 20
                    height: 20
                    y: 6
                    onCheckedChanged: {
                        backend.enable_uppercase(checked)
                        error_selected_none.visible = false
                    }
                    background: Rectangle {
                        color: uppercase_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: uppercase_cb.checked ? "black" : "black"
                        color: uppercase_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: uppercase_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
                Text {
                    font.pointSize: 12
                    topPadding: 3
                    text: "(e.g. ABCDEFG)"
                    leftPadding: 10
                    font.letterSpacing: 1
                }
            }
            Row {  
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Exclude Similar Characters:"
                    width: 450
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: similarchar_cb
                    checked: false
                    width: 20
                    height: 20 
                    y: 6
                    onCheckedChanged: {
                        backend.exclude_similarcharacters(checked)
                    }
                    background: Rectangle {
                        color: similarchar_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: similarchar_cb.checked ? "black" : "black"
                        color: similarchar_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: similarchar_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
                Text {
                    font.pointSize: 12
                    topPadding: 3
                    text: "(e.g. i,l,1,o,O,0)"
                    leftPadding: 10
                    font.letterSpacing: 1
                }
            }
            Row {
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Exclude Ambigious Characters:"
                    width: 450
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: ambigiouschar_cb
                    checked: false
                    anchors.verticalCenterOffset: -100
                    width: 20
                    y: 6
                    height: 20
                    onCheckedChanged: {
                        backend.exclude_ambigiouscharacters(checked)
                    }
                    background: Rectangle {
                        color: ambigiouschar_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: ambigiouschar_cb.checked ? "black" : "black"
                        color: ambigiouschar_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: ambigiouschar_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
                Text {
                    font.pointSize: 12
                    topPadding: 3
                    text: "(e.g. {} [] () /\ , ; : <>)"
                    leftPadding: 10
                    font.letterSpacing: 1
                }
            }
            Row {
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Generate a certain number of passwords:"
                    width: 450
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: passnum_cb
                    checked: false
                    y: 6
                    width: 20
                    height: 20
                    onCheckedChanged: {
                        backend.enable_certain_amount_of_passwords(checked)
                        row_maximum_password_length.visible = checked ? true : false
                        row_minimum_password_length.visible = checked ? true : false
                        row_password_length.visible = checked ? false : true
                        row_number_of_passwords.visible = checked ? true : false

                        generate_button_text.text = checked ? "Generate Passwords" : "Generate Password"
                        decorative_line.height = checked ?  decorative_line.height+130 :  decorative_line.height-130
                        recomendation.anchors.verticalCenterOffset = checked ? recomendation.anchors.verticalCenterOffset + 127 : recomendation.anchors.verticalCenterOffset - 127
                    }
                    background: Rectangle {
                        color: passnum_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: passnum_cb.checked ? "black" : "black"
                        color: passnum_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: passnum_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
            
            }
            Row {
                id: row_number_of_passwords
                visible: false
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Number: "
                    width: 450
                    y: 5
                    font.letterSpacing: 1
                }
                TextField {
                    Layout.fillWidth: true
                    id: userinput_number_of_passwords
                    padding: 20
                    font.pointSize: 12
                    font.letterSpacing: 1
                    font.bold: true
                    color: "black"
                    focus: true
                    onActiveFocusChanged: {
                        userinut_number_of_passwords_background.border.color = "black"
                    }
                    background: Rectangle { 
                        id: userinut_number_of_passwords_background
                        objectName: "userinput_background"
                        implicitWidth: 110
                        implicitHeight: 40
                        color: "white"
                        border.color: "black"
                        border.width: 2
                    }
                   
                }
            
            }


            Row {
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "Save to File:"
                    width: 450
                    font.letterSpacing: 1
                }
                CheckBox {
                    id: save_cb
                    checked: false
                    width: 20
                    height: 20
                    y: 5
                    onCheckedChanged: {
                        backend.enable_savetofile(checked)
                        row_file_name.visible = checked ? true : false
                        decorative_line.height = checked ?  decorative_line.height+60 :  decorative_line.height-60
                        recomendation.visible = checked ? true : false
                    }
                    background: Rectangle {
                        color: save_cb.hovered ? "#E3E3E3" : "white"
                        Behavior on color { ColorAnimation { duration: 120 } }
                    }
                    indicator: Rectangle {
                        width: parent.width
                        height: parent.height
                        border.width: 2
                        border.color: save_cb.checked ? "black" : "black"
                        color: save_cb.checked ? "black" : "transparent"
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Behavior on border.color { ColorAnimation { duration: 120 } }
                    
                        Text {
                            anchors.centerIn: parent
                            text: save_cb.checked ? "✔" : ""
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
  
                }
            }


            Row {
                id: row_file_name
                visible: false
                Text {
                    leftPadding: 20
                    font.pointSize: 15
                    text: "File Name:"
                    width: 450
                    y: 7
                    font.letterSpacing: 1
                }
                TextField {
                    Layout.fillWidth: true
                    id: userinput_file_name
                    objectName: "userinput_file_name"
                    padding: 20
                    font.pointSize: 12
                    font.letterSpacing: 1
                    font.bold: true
                    color: "black"
                    focus: true
                    onActiveFocusChanged: {
                        userinput_file_name_background.border.color = "black"
                    }
                    background: Rectangle {
                        id: userinput_file_name_background
                        objectName: "userinput_background"
                        implicitWidth: 180
                        implicitHeight: 40
                        color: "white"
                        border.color: "black"
                        border.width: 2
                    }
                   
                }
            }

            Text {
                id: error_selected_none
                topPadding: 5
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 15
                text: "You have not selected any symbols."
                color: "red"
                font.letterSpacing: 1
            }
        }




        Rectangle {
            id: decorative_line
            height: 450
            width: 1
            color: "#D9D9D9"   // тёмно‑серая тонкая линия
            anchors.verticalCenter: parent.verticalCenter
        }

            


        


        //////// THIRD OBJECT OF THE ROW
        Column {
            topPadding: 30
            //////////// GENERATE BUTTON
            Item {
                width: parent.width
                height: generate_button.implicitHeight + 20
                
                Button {
                    Material.theme: Material.Light
                    Material.accent: "transparent"
                    Material.primary: "transparent"
                    Material.background: "transparent"
                    id: generate_button
                    scale: 1.8
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 5
                    //width: 170
                    property bool is_error: false

                    onClicked: {
                        userinput_minimum_password_length_background.border.color = "black"
                        userinput_maximum_password_length_background.border.color = "black"
                        is_error = false
                        if (passnum_cb.checked === true) {
                            backend.get_minimum_and_maximum(userinput_minimum_password_length.text,userinput_maximum_password_length.text)
                        }
                        else {   // if one password
                            backend.get_password_length(userinput_password_length.text)

                        }

                        if (userinput_password_length.text === "" && !passnum_cb.checked) {
                            userinput_pass_length_background.border.color = "red"
                            is_error = true
                        }
                        if  (!numbers_cb.checked && !lowercase_cb.checked && !uppercase_cb.checked && !symbols_cb.checked) {
                            error_selected_none.visible = true
                            is_error = true
                        }
                        if (passnum_cb.checked) {
                            if (userinput_maximum_password_length.text === ""){
                                userinput_maximum_password_length_background.border.color = "red"
                                is_error = true
                            }
                            if (userinput_minimum_password_length.text === "") {
                                userinput_minimum_password_length_background.border.color = "red"
                                is_error = true
                            }
                            if (userinput_number_of_passwords.text === "") {
                                userinut_number_of_passwords_background.border.color = "red"
                                is_error = true
                            }
                            let minimum = parseInt(userinput_minimum_password_length.text)
                            let maximum = parseInt(userinput_maximum_password_length.text)
                            if (minimum > maximum) {
                                userinput_minimum_password_length_background.border.color = "red"
                                userinput_maximum_password_length_background.border.color = "red"
                                is_error = true
                            }
                        }
                    
                        if (userinput_file_name.text === "" && save_cb.checked)
                        {
                            is_error = true
                            userinput_file_name_background.border.color = "red"

                        }
                    


                        if (is_error === false) {
                            userinput_password_length.forceActiveFocus()
                            userinput_password_length.accepted() // Enter imitation
                            if (passnum_cb.checked) 
                                backend.get_passwords_number(userinput_number_of_passwords.text)
                            backend.button_pressed()
                        }
                    }
                    contentItem: Text {
                        id: generate_button_text
                        color: generate_button.hovered ? "white" : "black"
                        text: "Generate Password"
                        font.letterSpacing: 1
                        Behavior on color {
                            ColorAnimation {
                                duration: 10
                                easing.type: Easing.InOutQuad
                            }
                        }
                        rightPadding: 10
                    }
                    background: Rectangle {
                        color: generate_button.hovered ? "black" : "white"
                        border.color: "black"
                        border.width: 1
                        radius: 2
                        Behavior on color {
                            ColorAnimation {
                                duration: 10
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }
            }
        

            ScrollView {
                width: 300
                height: 290
                anchors.horizontalCenter: parent.horizontalCenter
                clip: true
                ScrollBar.vertical.visible: false
                TextArea {
                    id: passwords_area
                    leftPadding: 20
                    font.letterSpacing: 1
                    objectName: "passwords_area"
                    topPadding: 23
                    readOnly: true
                    wrapMode: TextArea.NoWrap
                    font.pixelSize: 18
                    color: "black"
                    width: 300
                    height: 300
                    background: Rectangle {
                        border.color: "black"
                        border.width: 2
                        radius: 8
                    }

                }
            }



            ////// COPY BUTTON
            Item {
                y: 480
                width: copy_button.width
                height: copy_button.height
                Button {
                    Material.theme: Material.Light
                    Material.accent: "transparent"
                    Material.primary: "transparent"
                    Material.background: "transparent"

                    id: copy_button
                    onClicked: {
                        backend.copy_button_pressed(passwords_area.text)
                        copy_button_text.text = "Copied!"
                        changeTimer.start()

                    }

                    width: 80
                    height: 30
                    padding: 0
                    contentItem: Text {
                        id: copy_button_text
                        color: copy_button.hovered ? "white" : "black"
                        text: "Copy"
                        font.letterSpacing: 1
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.margins: 0
                        anchors.topMargin: 20
                        Behavior on color {
                            ColorAnimation {
                                duration: 10
                                easing.type: Easing.InOutQuad
                            }
                        }
                    
                    }
                

                    Timer {
                    
                        id: changeTimer
                        interval: 10000    // 2 секунды
                        running: true
                        repeat: false     // один раз
                        onTriggered: {
                            copy_button_text.text = "Copy"
                        }
                    }

                    background: Rectangle {
                        color: copy_button.hovered ? "black" : "white"
                        width: parent.width
                        height: parent.height
                        border.color: "black"
                        border.width: 2
                        radius: 6
                        Behavior on color {
                            ColorAnimation {
                                duration: 10
                                easing.type: Easing.InOutQuad
                            }
                        }

                    }
                } 
            }
        }
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.bottom
        anchors.verticalCenterOffset: -20
        bottomPadding: 10
        Row {

            Text {
                text: "Made by "
                color: "black"
                font.pixelSize: 14
                font.letterSpacing: 0.4
            }
            Text {
                id: link
                text: "teshay"
                color: "red"
                font.pixelSize: 14
                font.underline: false
    
                MouseArea {
                    anchors.fill: parent
                    
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered:  {
                        link.font.underline = true
                    }
                    onExited: {
                        link.color = "red"
                        link.font.underline = false
                    }
                    onClicked: Qt.openUrlExternally("https://github.com/teshay-btw")
                }
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: "v1.0"
                color: "grey"
                font.pixelSize: 14
                font.letterSpacing: 0.4
            }
        }
    }
    Text {
        id: recomendation
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 137
        visible: false
        text: "*full path is recommended"
        font.italic: true
        color: "gray"
        font.pixelSize: 14
        font.letterSpacing: 1
    }
}
