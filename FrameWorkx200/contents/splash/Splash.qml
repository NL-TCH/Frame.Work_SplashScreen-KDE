 
/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
    import QtQuick 2.5
    import QtQuick.Window 2.2
Image {
    id: root
    source: "images/wallpaperblack.jpg"
    
   AnimatedImage { 
        anchors.centerIn: parent
        id: gif
        source: "images/framework-x2.0.gif"
        width: 800
        height: 600
        property int stage
    
        onStageChanged: {
            if (stage == 2) {
                introAnimation.running = true;
            } else if (stage == 5) {
                introAnimation.target = busyIndicator;
                introAnimation.from = 1;
                introAnimation.to = 0;
                introAnimation.running = true;
            }
        }
    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 3
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
   } 
}
