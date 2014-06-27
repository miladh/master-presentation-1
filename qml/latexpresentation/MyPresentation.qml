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

    MultiSlide{
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

    MultiSlide{
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
                        text: "Newton's equation:"
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
                        text: "Schrödinger equation:"
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

    MultiSlide{
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

    MultiSlide{
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

    MultiSlide{
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


    MultiSlide{
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
                        text: "Separable wave function:"
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
                        text: "Electronic Schrödinger equation:"
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
                        text: "Nuclear Schrödinger equation:"
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


    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Born-Oppenheimer\nMolecular Dynamics"
                }
            },
            UpperRightSlide {
                id: bomd
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Electrons as quantum particles:"
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
                        text: "Nuclei as classical point particles:"
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
    // -----------------aimd--------------------------
    // -----------------------------------------------


    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Ab Initio\nMolecular Dynamics"
                }
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/aimd.png"
                }
            }
        ]
    }


    // -----------------------------------------------
    // -----------------BOMD Repeate-----------------
    // -----------------------------------------------


    MultiSlide{
        UpperLeftSlide {
            Heading {
                text: "Born-Oppenheimer\nMolecular Dynamics"
            }
        }
        UpperRightSlide {
            id: bomd2
            Column {
                anchors.centerIn: parent

                Text{
                    text: "Electrons as quantum particles:"
                    font.pixelSize: bomd2.contentFont.pixelSize * 0.6
                }
                Item {
                    height: bomd2.height * 0.03
                    width: 1
                }
                Latex {
                    anchors.centerIn: undefined
                    width: bomd2.width * 0.5
                    text: "$$
                                \\underbrace{
                                \\left(-\\sum_{i}^{N_e}
                                \\frac{\\nabla_i^2}{2}
                                +V_{\\mathrm{Ne}}(\\mathbf{r},\\mathbf{R})\\right)}_{\\mathcal{H}_{\\mathrm{Ne}}}
                                \\Psi_{\\mathrm{el}} = E_{\\mathrm{Ne}}(\\mathbf{R}) \\Psi_{\\mathrm{el}}
                                $$"
                }
                Item {
                    height: bomd2.height * 0.05
                    width: 1
                }
                Text{
                    text: "Nuclei as classical point particles:"
                    font.pixelSize: bomd2.contentFont.pixelSize * 0.6
                }
                Item {
                    height: bomd2.height * 0.03
                    width: 1
                }

                Latex {
                    anchors.centerIn: undefined
                    width: bomd2.width * 0.5
                    text: "	$$
                                M_n  \\ddot{\\mathbf{R}}_n = -\\nabla_n
                                \\underset{\\Psi_{\\mathrm{el},0}}{\\text{min}}
                                \\left\\{\\langle{\\Psi_{\\mathrm{el},0}}|\\mathcal{H}_{\\mathrm{Ne}}|\\Psi_{\\mathrm{el},0}\\rangle
                                \\right\\}
                                $$"
                }
            }


        }

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
    }



    // -----------------------------------------------
    // -----------------Variational-------------------
    // -----------------------------------------------


    MultiSlide{
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


    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Hartree-Fock"
                }
            },
            UpperRightSlide {
                title: "Slater Determinant"
                Latex {
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



    MultiSlide{
        UpperLeftSlide {
            Heading {
                text: "Hartree-Fock"
            }
        }
        delayedContent: [
            UpperRightSlide {
                title: "Fock Operator"
                Latex {
                    text: "\\begin{align*}
                            \\mathcal{F}&= -\\frac{1}{2} \\nabla^2
                            - \\sum_{n=1}^{N_n} \\frac{Z_n}{|\\mathbf{r} - \\mathbf{R}_n|}
                            + V^{\\mathrm{HF}},\\\\
                            V^{\\mathrm{HF}} \\psi_k(\\mathbf{q})
                            &=\\sum_l\\left[ \\int \\frac{\\psi_l^*(\\mathbf{q}') \\psi_l(\\mathbf{q}')}{|{\\bf r} - {\\bf r}'|}
                            \\mathrm{d} \\mathbf{q}' \\; \\psi_k(\\mathbf{q})
                            -\\int \\frac{\\psi_l^*(\\mathbf{q}') \\psi_k(\\mathbf{q}')}{|{\\bf r} - {\\bf r}'|}
                            \\mathrm{d} \\mathbf{q}' \\; \\psi_l(\\mathbf{q})\\right]
                           \\end{align*}"
                }
            }
        ]
    }



    // -----------------------------------------------
    // ----------- Spin Orbitals----------------------
    // -----------------------------------------------


    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Spin Orbitals"
                }
            },
            UpperRightSlide {
                DefaultImage {
                    source: "../../figures/wavefunction.png"
                }
            }
        ]
    }


    // -----------------------------------------------
    // ----------------------LCAO---------------------
    // -----------------------------------------------


    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Linear Combination\nofAtomic Orbitals"
                }
            },
            UpperRightSlide {
                BorderedImage {
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: h2omoTitle.top
                        top: parent.top
                    }
                    source: "../../figures/mo_h2o.png"
                }
                Latex {
                    id: h2omoTitle
                    anchors {
                        bottom: parent.bottom
                        centerIn: undefined
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width * 0.1
                    text: "H$_2$O"
                }
            }
        ]
    }



    // -----------------------------------------------
    // ----------- Spatial Orbitals-------------------
    // -----------------------------------------------

    MultiSlide{
        UpperLeftSlide {
            Heading {
                text: "Spin Orbitals"
            }
        }
        delayedContent: [
            UpperRightSlide {
                DefaultImage {
                    source: "../../figures/wavefunction.png"
                }
            }
        ]
        LowerLeftSlide {
            Heading {
                text: "Spatial Orbitals"
            }
        }
        LowerRightSlide {
            DefaultImage {
                source: "../../figures/mo_ao.png"
            }
        }
    }



    // -----------------------------------------------
    // ----------- basis-------------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                centeredText: "Which basis set to use?"
            },
            UpperRightSlide {
                Latex {
                    text: "\\begin{equation*}
                            \\int \\varphi_p^*(\\mathbf{r})O(\\mathbf{r})\\varphi_q(\\mathbf{r}) \\dif \\mathbf{r}
                            \\end{equation*}
                            \\begin{equation*}
                            \\int \\varphi_{p}^*(\\mathbf{r})\\varphi_{r}^*(\\mathbf{r}') \\; \\frac{1}{|{\\bf r} - {\\bf
                            r}'|} \\; \\varphi_{q}(\\mathbf{r}) \\varphi_{s}(\\mathbf{r}') \\dif
                            \\mathbf{r}\\dif\\mathbf{r}'
                            \\end{equation*}"
                }
            }
        ]
    }


    // -----------------------------------------------
    // ----------- GTOs-------------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Gaussian Type Orbitals"
                }
            },
            UpperRightSlide {
                Latex {
                    text: "\\begin{align*}
                            \\varphi^{\\mathrm{GTO}}_{ijk} (\\mathbf{r})
                            &=  x^i y^j z^k \\exp(-\\alpha r^2)\\\\
                            &=\\varphi^{\\mathrm{GTO}}_{i}(x)
                            \\varphi^{\\mathrm{GTO}}_{j}(y)
                            \\varphi^{\\mathrm{GTO}}_{k}(z) ,\\\\
                            \\varphi^{\\mathrm{GTO}}_{i}(x) &= x^i \\exp(-\\alpha x^2)
                            \\end{align*}"
                }
            },
            LowerLeftSlide {
                DefaultImage {
                    source: "../../figures/gaussProd.png"
                }
            },
            LowerRightSlide {
                Heading {
                    text: "McMurchie-Davidson Scheme"
                }
            }
        ]
    }


    // -----------------------------------------------
    // ----------- Recap-------------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                centeredText: "Recap"
            },
            UpperRightSlide {
                id: bomd1
                title: "Ab Initio Molecular Dynamics"
                Column {
                    anchors.centerIn: parent

                    Text{
                        text: "Electrons as quantum particles:"
                        font.pixelSize: bomd1.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: bomd1.height * 0.03
                        width: 1
                    }
                    Latex {
                        anchors.centerIn: undefined
                        width: bomd1.width * 0.5
                        text: "$$\\underbrace{
                                \\left(-\\sum_{i}^{N_e}
                                \\frac{\\nabla_i^2}{2}
                                +V(\\mathbf{r},\\mathbf{R})\\right)}_{\\mathcal{H}}
                                \\Psi = E\\Psi
                                $$"
                    }
                    Item {
                        height: bomd1.height * 0.05
                        width: 1
                    }
                    Text{
                        text: "Nuclei as classical point particles:"
                        font.pixelSize: bomd1.contentFont.pixelSize * 0.6
                    }
                    Item {
                        height: bomd1.height * 0.03
                        width: 1
                    }

                    Latex {
                        anchors.centerIn: undefined
                        width: bomd1.width * 0.5
                        text: "	$$
                                    M_n  \\ddot{\\mathbf{R}}_n = -\\nabla_n
                                    \\underset{\\Psi_{0}}{\\text{min}}
                                    \\left\\{\\langle{\\Psi_{0}}|\\mathcal{H}|\\Psi_{0}\\rangle
                                    \\right\\}
                                    $$"
                    }
                }

            },
            LowerLeftSlide {
                title: "Hartree-Fock"
                Latex {
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
                            \\end{vmatrix}​\\\\
                            \\begin{align*}
                            \\mathcal{F}&= -\\frac{1}{2} \\nabla^2
                            - \\sum_{n=1}^{N_n} \\frac{Z_n}{|\\mathbf{r} - \\mathbf{R}_n|}
                            + V^{\\mathrm{HF}}
                           \\end{align*}
                            $$"
                }
            },
            LowerRightSlide {
                Grid {
                    rows: 2
                    anchors.fill: parent

                    DefaultImage {
                        width: parent.width
                        height: parent.height / 2.0
                        anchors.fill: undefined
                        source: "../../figures/wavefunction.png"
                    }
                    DefaultImage {
                        width: parent.width
                        height: parent.height / 3.0
                        anchors.fill: undefined
                        source: "../../figures/mo_ao.png"
                    }
                }

            }
        ]
    }



    // -----------------------------------------------
    // ----------- Implementations--------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Implementations"
                }
            },
            UpperRightSlide {
                centeredText: "Hartree-Fock code based on McMurchie-Davidson scheme\n\n"+
                              "Born-Oppenheimer molecular dynamics code based on Hartree-Fock calculations"
            },
            LowerRightSlide {
                centeredText: "Numerous verification tests:\n\n"+
                              "Unit tests, benchmarking"
            }
        ]
    }


    // -----------------------------------------------
    // ----------- Graphical Models-------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Graphical Models"
                }

            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/benzene.png"
                }
            },
            LowerLeftSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/ions.png"
                }
            },
            LowerRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/boron.png"
                }
            }
        ]
    }


    // -----------------------------------------------
    // ----------- Electrostatic potential-----------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Electrostatic Potential"
                }

            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/epBenzene.png"
                }
            },
            LowerRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/dimer.png"
                }
            }
        ]
    }


    // -----------------------------------------------
    // -----------Reaction----------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                centeredText: "An application of\nBorn-Oppenheimer\n molecular dynamics"
            },
            UpperRightSlide {
                title: "Nucleophilic Substitution Reaction"
                DefaultImage {
                    source: "../../figures/reactionDiagram.png"
                }
            }
        ]
    }



    // -----------------------------------------------
    // -----------Video-------------------------------
    // -----------------------------------------------
    MultiSlide{
        UpperLeftSlide {
            title: "Nucleophilic Substitution Reaction"
        }

        UpperRightSlide {
            Rectangle {
                width: parent.width
                height: parent.height
                color:"black"
                Video
                {
                    id: video
                    anchors.fill: parent
                    source:"../../videos/aout.mp4"
                    autoPlay:  false
                    autoLoad:  false

                }
                Button {
                    id: button
                    text: "Play"
                    anchors {
                        bottom: parent.bottom
                    }
                    onClicked: {
                        if(video.playbackState === MediaPlayer.StoppedState
                                || video.playbackState === MediaPlayer.PausedState) {
                            video.play()
                        } else {
                            video.pause()
                        }
                    }
                }
                Slider{
                    anchors {
                        bottom: parent.bottom
                        left: button.right
                        right: video.right

                    }
                    width: parent.width * 0.1
                    value: video.position
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: video.duration
                    onPressedChanged: {
                        if(pressed) {
                            video.pause()
                        } else {
                            video.play()
                        }
                    }

                    onValueChanged: video.seek(value)
                }
            }
        }
    }


    // -----------------------------------------------
    // -----------EP reaction-------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                title: "Negative Electrostatic Potential"
                DefaultImage {
                    anchors.fill: parent
                    source: "../../figures/densityCH5.png"
                }
            },
            UpperRightSlide {
                title: "Atomic Net Charges "
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/charges.png"
                }
            }
        ]
    }


    // -----------------------------------------------
    // -----------Basis Effect------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                centeredText:  "The effect of basis set"
            },
            UpperRightSlide {
                title: "BondLengths"
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/ch5Bonds.png"
                }
            },
            LowerRightSlide {
                title: "Energies"
                BorderedImage {
                    anchors.fill: parent
                    source: "../../figures/ch5Energies.png"
                }
            }

        ]
    }




    // -----------------------------------------------
    // -----------Future work-------------------------
    // -----------------------------------------------

    MultiSlide{
        delayedContent: [
            UpperLeftSlide {
                Heading {
                    text: "Future Prospects"
                }
            },
            UpperRightSlide {
                centeredText: "Hartree-Fock + Quantum Monte Carlo"
            },
            LowerLeftSlide {
                centeredText: "McMurchie-Davidson scheme\n+\nCar-Parrinello\n\n"+
                              "McMurchie-Davidson scheme\n+\nDensity functional theory"
            },
            LowerRightSlide {
                centeredText: "Potential parameterizations"
            }
        ]
    }


    // -----------------------------------------------
    // -----------Thanks------------------------------
    // -----------------------------------------------

    UpperLeftSlide {
        centeredText: "Thank you for your attention!"
    }
















}



