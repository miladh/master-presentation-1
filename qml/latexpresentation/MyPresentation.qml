//import Qt.labs.presentation 1.0
import QtQuick 2.2
import LatexPresentation 1.0
import QtQuick.Controls 1.1
import QtMultimedia 5.0
import QtGraphicalEffects 1.0

TransitionPresentation
{
    id: presentation

    focus: true

    transitionTime: 500

    width: 800
    height: 600

    textColor: "black"

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FFFFFF" }
            GradientStop { position: 1.0; color: "#f7f2d3" }
        }
    }

    Slide {
        UpperLeftSlide {
            id: firstSlide
            Heading {
                anchors {
                    verticalCenterOffset: -parent.height * 0.1
                }

                text: "Ab Initio Molecular Dyanmics:\nA Virtual Laboratory "
            }
            Text {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.05
                font.family: firstSlide.titleFontFamily
                font.pixelSize: firstSlide._titleFontSize * 0.5
                lineHeight: 1.2
                horizontalAlignment: Text.Center
                wrapMode: Text.Wrap
                text: "Milad H. Mobarhan\nUniversity of Oslo, Computational Physics\nJune 2014"
            }
        }
        UpperRightSlide {
            BorderedImage {
                anchors.fill: parent
                source: "../../figures/densityCH5_2.png"
            }
        }
    }

    // -----------------------------------------------
    // --------------- Introduction ------------------
    // -----------------------------------------------

    Slide {
        id: physicalDomains
        anchors.fill: parent
        delayedContent: [
            UpperLeftSlide {
                DefaultImage {
                    source: "../../figures/physicsDomain.png"
                }
            },
            LowerLeftSlide {
                id: classical
                title: "Classical Mechanics"
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Newton's Equation:"
                        font.family: classical.contentFont.family
                        font.pixelSize: classical.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: classical.height * 0.05
                        width: 1
                    }
                    Latex {
                        anchors.centerIn: undefined
                        width: classical.width * 0.13
                        text: "$$\\mathbf{F} = m \\mathbf{a}$$"
                    }
                    Item {
                        height: classical.height * 0.1
                        width: 1
                    }
                    Text{
                        text: "N-body problem:"
                        font.family: classical.contentFont.family
                        font.pixelSize: classical.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: classical.height * 0.05
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: classical.width * 0.37
                        text: "$$X_{i}(t),\\quad i = 1,2,\\dots,N$$"
                    }
                }
            },
            LowerRightSlide {
                id: quantum
                title: "Quantum Mechanics"
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Schrödinger Equation:"
                        font.family: classical.contentFont.family
                        font.pixelSize: classical.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: classical.height * 0.05
                        width: 1
                    }
                    Latex {
                        anchors.centerIn: undefined
                        width: classical.width * 0.25
                        text: "$$i \\hbar \\frac{\\partial}{\\partial t}\\Psi= \\mathcal{H}\\Psi$$"
                    }
                    Item {
                        height: classical.height * 0.1
                        width: 1
                    }
                    Text{
                        text: "N-body problem:"
                        font.family: classical.contentFont.family
                        font.pixelSize: classical.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: classical.height * 0.05
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: classical.width * 0.3
                        text: "$$\\Psi(\\mathbf{r}_1,\\mathbf{r}_1,\\dots,\\mathbf{r}_N, t)$$"
                    }
                }
            }
        ]
    }


    // -----------------------------------------------
    // ---------------Molecular Dynamics--------------
    // -----------------------------------------------

    Slide {
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Molecular Dynamics"
                }

            },
            UpperRightSlide {
                DefaultImage {
                    source: "../../figures/MDsvenni.png"
                }
            },
            LowerLeftSlide {
                DefaultImage {
                    source: "../../figures/atomTopoint.png"
                }
            },
            LowerRightSlide {
                DefaultImage {
                    source: "../../figures/newton.png"
                }
            }
        ]
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Molecular Dynamics:"
                centeredText: "Laws of Interaction"
            },
            UpperRightSlide {
                id: lawOfInteraction
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Potential:"
                        font.pixelSize: lawOfInteraction.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: lawOfInteraction.height * 0.05
                        width: 1
                    }
                    Latex {
                        anchors.centerIn: undefined
                        width: lawOfInteraction.width * 0.43
                        text: "\\begin{align*}
                                V&= \\sum_k^{N} V_1(\\mathbf{R}_k)
                                 + \\sum_{k < l}^{N} V_2(\\mathbf{R}_k, \\mathbf{R}_l)\\\\
                                 &+ \\sum_{k < l < m}^{N} V_3(\\mathbf{R}_k, \\mathbf{R}_l, \\mathbf{R}_m)
                                 +\\ldots
                                \\end{align*}"
                    }
                    Item {
                        height: lawOfInteraction.height * 0.1
                        width: 1
                    }
                    Text{
                        text: "Force:"
                        font.pixelSize: lawOfInteraction.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: lawOfInteraction.height * 0.05
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: lawOfInteraction.width * 0.15
                        text: "$\\mathbf{F}= -\\nabla V$"
                    }
                }


            },
            LowerLeftSlide {
                Grid {
                    columns: 2
                    anchors.fill: parent

                    DefaultImage {
                        width: parent.width / 2
                        height: parent.height / 2
                        anchors.fill: undefined
                        source: "../../figures/bondStrech.png"
                    }
                    DefaultImage {
                        width: parent.width / 2
                        height: parent.height / 2
                        anchors.fill: undefined
                        source: "../../figures/angleBend.png"
                    }
                    DefaultImage {
                        width: parent.width / 2
                        height: parent.height / 2
                        anchors.fill: undefined
                        source: "../../figures/coul.png"
                    }
                    DefaultImage {
                        width: parent.width / 2
                        height: parent.height / 2
                        anchors.fill: undefined
                        source: "../../figures/lj.png"
                    }
                }

            }
        ]
    }

    UpperLeftSlide {
        id: clmd
        title: "Molecular Dynamics:"
        centeredText: "Limitations:\n\nQuantum effects\nChallenging task"
    }


    // -----------------------------------------------
    // -----------  Quantum mechanics- ---------------
    // -----------------------------------------------

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Schrödinger Equation"
                Latex {
                    width: parent.width * 0.2
                    text: "$$i \\hbar \\frac{\\partial}{\\partial t}\\Psi= \\mathcal{H}\\Psi$$"
                }
            },
            UpperRightSlide {
                title: "Hamiltonian"
                Latex {
                    width: parent.width * 0.9
                    text: "$$
                            \\mathcal{H} = -\\sum_{i}^{N_e} \\frac{\\nabla_i^2 }{2}
                            - \\sum_{n}^{N_n} \\frac{\\nabla_n^2}{2M_n}
                            -\\sum_{n}^{N_n}\\sum_{i}^{N_e}\\frac{Z_n}{|{\\bf r}_i - {\\bf R}_n|}
                            + \\sum_{{i < j}}^{N_e} \\frac{1}{|{\\bf r}_i - {\\bf r}_j|}
                            -\\sum_{{n < m}}^{N_n} \\frac{Z_n Z_{m}}{|{\\bf R}_n - {\\bf R}_{m}|}
                            $$"
                }
            },
            LowerRightSlide {
                title: "Wave Function"
                Latex {
                    width: parent.width * 0.2
                    text: "$$\\Psi\\left(\\{\\mathbf{R}_n\\}, \\{\\mathbf{r}_i\\}, t\\right)$$"
                }
            }
        ]
    }




    // -----------------------------------------------
    // -----------  Born-Oppenheimer -----------------
    // -----------------------------------------------


    Slide {
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Born-Oppenheimer\nApproximation"
                }
            },
            LowerLeftSlide {
                DefaultImage {
                    source: "../../figures/mass.png"
                }
            },
            UpperRightSlide {
                id: boa
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Separable Wave Function:"
                        font.pixelSize: boa.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: boa.height * 0.03
                        width: 1
                    }
                    Latex {
                        anchors.centerIn: undefined
                        width: boa.width * 0.5
                        text: "$$
                                \\Psi\\big(\\{\\mathbf{R}_n\\}, \\{\\mathbf{r}_i\\}, t\\big) \\quad \\Rightarrow \\quad
                                \\begin{array}{l}
                                \\chi\\big(\\{\\mathbf{R}_n\\}, t\\big)\\\\
                                \\Psi_{\\mathrm{el}}\\big(\\{\\mathbf{r}_i\\};\\{\\mathbf{R}_n\\}\\big)
                                \\end{array}
                                $$"
                    }
                    Item {
                        height: boa.height * 0.05
                        width: 1
                    }
                    Text{
                        text: "Electronic Schrödinger Equation:"
                        font.pixelSize: boa.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: boa.height * 0.03
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: boa.width * 0.5
                        text: "	$$
                                \\left(-\\sum_{i}^{N_e}
                                \\frac{\\nabla_i^2}{2}+V_{\\mathrm{Ne}}(\\mathbf{r},\\mathbf{R})\\right)
                                \\Psi_{\\mathrm{el}} = E_{\\mathrm{Ne}}(\\mathbf{R}) \\Psi_{\\mathrm{el}}
                                $$"
                    }

                    Item {
                        height: boa.height * 0.05
                        width: 1
                    }
                    Text{
                        text: "Nuclear Schrödinger Equation:"
                        font.pixelSize: boa.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: boa.height * 0.03
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: boa.width * 0.5
                        text: "	$$
                            i \\hbar \\frac{\\partial}{\\partial t} \\chi =
                            \\left(
                            - \\sum_{n}^{N_n} \\frac{\\nabla_n^2}{2M_n}
                            +  E_{\\mathrm{Ne}}(\\mathbf{R})\\right)\\chi
                            $$"
                    }
                }


            }
        ]
    }



    // -----------------------------------------------
    // -----------------BOMD--------------------------
    // -----------------------------------------------


    Slide {
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Born-Oppenheimer\nMolecular dynamics"
                }
            },
            UpperRightSlide {
                id: bomd
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Electrons as Quantum Particles:"
                        font.pixelSize: bomd.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: bomd.height * 0.03
                        width: 1
                    }
                    Latex {
                        anchors.centerIn: undefined
                        width: bomd.width * 0.5
                        text: "$$
                                \\underbrace{
                                \\left(-\\sum_{i}^{N_e}
                                \\frac{\\nabla_i^2}{2}
                                +V_{\\mathrm{Ne}}(\\mathbf{r},\\mathbf{R})\\right)}_{\\mathcal{H}_{\\mathrm{Ne}}}
                                \\Psi_{\\mathrm{el}} = E_{\\mathrm{Ne}}(\\mathbf{R}) \\Psi_{\\mathrm{el}}
                                $$"
                    }
                    Item {
                        height: bomd.height * 0.05
                        width: 1
                    }
                    Text{
                        text: "Nuclei as Classical Point Particles:"
                        font.pixelSize: bomd.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: bomd.height * 0.03
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: bomd.width * 0.5
                        text: "	$$
                                M_n  \\ddot{\\mathbf{R}}_n = -\\nabla_n
                                \\underset{\\Psi_{\\mathrm{el},0}}{\\text{min}}
                                \\left\\{\\langle{\\Psi_{\\mathrm{el},0}}|\\mathcal{H}_{\\mathrm{Ne}}|\\Psi_{\\mathrm{el},0}\\rangle
                                \\right\\}
                                $$"
                    }
                }


            },

            LowerRightSlide {
               Latex{
                   text: "\\begin{align*}
                   V_{\\mathrm{CM}}= \\sum_k^{N} V_1(\\mathbf{R}_k)
                    + \\sum_{k < l}^{N} V_2(\\mathbf{R}_k, \\mathbf{R}_l)
                    &+ \\sum_{k < l < m}^{N} V_3(\\mathbf{R}_k, \\mathbf{R}_l, \\mathbf{R}_m)
                    +\\dots
                   \\\\\\\\ &\\Downarrow \\\\ \\\\
                   V_{\\mathrm{BOMD}} = -\\nabla_n
                   \\underset{\\Psi_{\\mathrm{el},0}}{\\text{min}}&
                   \\left\\{\\langle{\\Psi_{\\mathrm{el},0}}|\\mathcal{H}_{\\mathrm{Ne}}|\\Psi_{\\mathrm{el},0}\\rangle
                   \\right\\}
                   \\end{align*}"
               }
            }

        ]
    }



    // -----------------------------------------------
    // -----------------Variational-------------------
    // -----------------------------------------------


    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Electronic Schrödinger Equation:"
                Latex {
                    width: parent.width * 0.5
                    text: "$$
                            \\left(-\\sum_{i}^{N_e}
                            \\frac{\\nabla_i^2}{2}
                            +V(\\mathbf{r},\\mathbf{R})\\right)
                            \\Psi = E\\Psi
                            $$"
                }
            },
            UpperRightSlide {
                title:  "Variational Principle:"
                Latex {
                    width: parent.width * 0.5
                    text: "$$
                            \\langle\\Psi|\\mathcal{H}|\\Psi\\rangle
                            \\ge \\langle\\Psi_{0}|\\mathcal{H}|\\Psi_{0}\\rangle = E_0
                            $$"
                }
            }
        ]
    }




    // -----------------------------------------------
    // -----------------HF----------------------------
    // -----------------------------------------------


    Slide {
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Hartree-Fock"
                }
            },
            UpperRightSlide {
                title: "Slater Determinant"
                Latex {
//                    width: parent.width * 0.2
                    text: "$$
                            \\Psi_{0} \\approx \\Psi =
                            \\frac{1}{\\sqrt{N!}}
                            \\begin{vmatrix}​
                            \\psi_{1}(\\mathbf{q}_1)​ & \\psi_{2}(\\mathbf{q}_1)​ & \\cdots &
                            \\psi_{{N_e}}(\\mathbf{q}_1)​ \\\\
                            \\psi_{1}(\\mathbf{q}_2)​ & \\psi_{2}(\\mathbf{q}_2)​ & \\cdots &
                            \\psi_{{N_e}}(\\mathbf{q}_2)​ \\\\
                            \\vdots & \\vdots & \\ddots & \\vdots \\\\
                            \\psi_{1}(\\mathbf{q}_{N_e})​ & \\psi_{2}(\\mathbf{q}_{N_e})​ & \\cdots &
                            \\psi_{{N_e}}(\\mathbf{q}_{N_e})​ \\\\
                            \\end{vmatrix}​
                            $$"
                }
            },
            LowerRightSlide {
                centeredText: "Pauli exclusion principle ✓ \n" +
                              "Electronic correlations ✗\n"
            }
        ]
    }






















    // -----------------------------------------------
    // -----------  Molecular dynamics ---------------
    // -----------------------------------------------


    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Molecular Dynamics"
                centeredText: "Classical potentials\nand newtonian mechanics"
            },
            LowerLeftSlide {
                centeredText: "Particles defined by position, velocity and type.\n" +
                              "Step-wise time-integration.\n" +
                              "Forces from potential:"
                Latex {
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                        horizontalCenter: parent.horizontalCenter
                        centerIn: undefined
                    }
                    width: parent.width * 0.2
                    text: "$$F = -\\nabla V$$"
                }
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/emdee-5.png"
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Classical Potentials"
        Latex {
            text: "$$V(\\mathbf{r}) " +
                  " = \\sum_{i} V_{1}(\\mathbf{r}_{i})" +
                  " + \\sum_{i<j} V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                  " + \\sum_{i<j<k} V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k})$$"
        }
    }

    UpperLeftSlide {
        title: "How Do We Define a Potential?"
        centeredText: "From experiments\nand/or quantum mechanics"
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Two-Body Terms"
                Latex {
                    width: parent.width * 0.5
                    text: "$$ V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                          " = V_{2}(r_{ij})$$"
                }
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    title: "Lennard-Jones"
                    Latex {
                        width: parent.width * 0.5
                        text: "$$V_{\\mathrm{LJ}}(r)" +
                              " = 4\\epsilon \\left ( \\frac{\\sigma^{12}}{r^{12}} - \\frac{\\sigma^{6}}{r^{6}} \\right)$$"
                    }
                }
                LowerRightSlide {
                    BorderedImage {
                        anchors.fill: parent
                        source: "../../images/lennard-jones.png"
                    }
                }
            }
        ]
    }

    Slide {
        UpperLeftSlide {
            title: "Three-Body Terms"
            Latex {
                width: parent.width * 0.7
                text: "$$ V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k})" +
                      " = V_{3}(r_{ij}, r_{ik}, \\theta_{jik})$$"
            }
        }
        UpperRightSlide {
            DefaultImage {
                source: "../../images/trimer-ijk.png"
            }
        }
    }

    UpperLeftSlide {
        title: "Does It Make Sense?"
        centeredText: "Are the results reasonable?"
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Test Case: Argon Crystallization"
                centeredText: "Boiling argon\ncooled slowly"
            },
            Item {
                anchors.fill: parent
                LowerRightSlide {
                    BorderedImage {
                        anchors.fill: parent
                        source: "../../images/argon-crystallization-energy-pressure.png"
                    }
                }
                UpperRightSlide {
                    centeredText: "Phase change at about 90K.\n" +
                                  "True boiling point: 87K.\n" +
                                  "True melting point: 84K."
                }
            },
            LowerLeftSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/argon-crystallization-focus-blur.png"
                }
            }
        ]
    }

    // -----------------------------------------------
    // ------- Computational Quantum Mechanics -------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Computational\nQuantum Mechanics"
        }
    }

    UpperLeftSlide {
        title: "Assumptions"
        delayPoints: true
        bullets: ["Born-Oppenheimer: classical nuclei",
            "Slater determinant: only exchange correlations"]
    }

    UpperLeftSlide {
        title: "Born-Oppenheimer"
        bullets: ["Nuclei are treated classically",
            "Assumes ground state",
            "Coarse, but good approximation"]
    }

    UpperLeftSlide {
        title: "Hartree-Fock Method"
        centeredText: "Slater determinant, single-particle wave functions"
    }

    UpperLeftSlide {
        title: "Hartree-Fock Method"
        centeredText: "Mean field approximation"
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Electron Density"
                centeredText: "Live!"
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            bottom: h2oTitle2.top
                            top: parent.top
                        }
                        source: "../../images/highcontrast.png"
                    }
                    Latex {
                        id: h2oTitle2
                        anchors {
                            bottom: parent.bottom
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.width * 0.1
                        text: "H$_2$O"
                    }
                }
                LowerLeftSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            bottom: nh3Title2.top
                            top: parent.top
                        }
                        source: "../../images/nh3-orbital5-cropped.png"
                    }
                    Latex {
                        id: nh3Title2
                        anchors {
                            bottom: parent.bottom
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.width * 0.1
                        text: "NH$_3$"
                    }
                }
                LowerRightSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            bottom: o2Title2.top
                            top: parent.top
                        }
                        source: "../../images/o2-orbital-15-high-contrast-cropped.png"
                    }
                    Latex {
                        id: o2Title2
                        anchors {
                            bottom: parent.bottom
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.width * 0.07
                        text: "O$_2$"
                    }
                }
            }
        ]
    }

    Slide {
        UpperLeftSlide {
            title: "Electrostatic Potential"
            centeredText: "Shows electro- and nucleophilic areas"
        }
        UpperRightSlide {
            BorderedImage {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: h2oTitle.top
                    top: parent.top
                }
                source: "../../images/h2o-electrostatic-potential-bearboat-3-cropped.png"
            }
            Latex {
                id: h2oTitle
                anchors {
                    bottom: parent.bottom
                    centerIn: undefined
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.1
                text: "H$_2$O"
            }
        }
        LowerLeftSlide {
            BorderedImage {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: ch4Title.top
                    top: parent.top
                }

                source: "../../images/ch4-electrostatic-potential-2.png"
            }
            Latex {
                id: ch4Title
                anchors {
                    bottom: parent.bottom
                    centerIn: undefined
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.1
                text: "CH$_4$"
            }
        }
        LowerRightSlide {
            BorderedImage {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: nh3Title.top
                    top: parent.top
                }
                source: "../../images/nh3-electrostatic-potential.png"
            }
            Latex {
                id: nh3Title
                anchors {
                    bottom: parent.bottom
                    centerIn: undefined
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.1
                text: "NH$_3$"
            }
        }
    }

    UpperLeftSlide {
        title: "Path to Molecular Dynamics"
        centeredText: "Energy to potential energy"
    }

    // -----------------------------------------------
    // --------------- Neural networks ---------------
    // -----------------------------------------------


    UpperLeftSlide {
        Heading {
            text: "Artificial\nNeural Networks"
        }
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Neural Network"
                centeredText: "Connected neurons"
            },
            LowerLeftSlide {
                Image {
                    anchors.fill: parent
                    source: "../../images/network.png"
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                    smooth: true
                }
            },
            UpperRightSlide {
                title: "Neuron"
                Latex {
                    width: parent.width * 0.5
                    text: "$$y(\\mathbf{x}) = g \\left ( \\sum_{i=1}^{n} w_{i} x_{i} \\right )$$"
                }
            },
            LowerRightSlide {
                Image {
                    anchors.fill: parent
                    source: "../../images/neuron.png"
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                    smooth: true
                }
            }
        ]
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Training"
                centeredText: "Backpropagation"
            },
            UpperRightSlide {
                Image {
                    anchors.fill: parent
                    source: "../../images/split-neuron.png"
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                    smooth: true
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Approximating potentials"
        centeredText: "Show images!"
    }

    UpperLeftSlide {
        title: "Results in Hydrogen Molecules"
        centeredText: "Show images!"
    }

    UpperLeftSlide {
        title: "Hydrogen Dissociation"
        centeredText: "Show results!"
    }

    UpperLeftSlide {
        title: "Future Possibilities"
        centeredText: "Better quantum, better neural"
    }

    // -----------------------------------------------
    // ---------------- Visualization ----------------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Visualization"
        }
    }

    Slide {
        UpperLeftSlide {
            title: "Volume Rendering of Density"
            centeredText: "Rays are traced through a cube of volume data.\n"+
                          "Values of the data are accumulated and define the intensity and color of a pixel."
        }
        UpperRightSlide {
            BorderedImage {
                anchors.fill: parent
                source: "../../images/raytracing.png"
            }
        }
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Millions of Atoms"
                centeredText: "Live demo!"
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/oculusqt3d-3.png"
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Virtual Reality"
        centeredText: "Live demo!"
    }

    UpperLeftSlide {
    }

}

// TODO: Check thesis for more bullets!


