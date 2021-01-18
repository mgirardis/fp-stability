# fp-stability
A set of MATLAB functions used to calculate bifurcations and fixed point stability of simple maps (difference equations).

See the example files and the figures generated by them in the **fig** subdirectory.

# scientific publications (please cite)

* Girardi-Schappo M, Galera EF, Carvalho TTA, Brochini L, Kamiji NL, Roque AC, Kinouchi O (2020): A unified theory of E/I synaptic balance, quasicritical neuronal avalanches and asynchronous irregular spiking. bioRXiv: https://doi.org/10.1101/2020.12.17.423201

* Girardi-Schappo M, Brochini L, Costa AA, Carvalho TTA, Kinouchi O (2020): Synaptic balance due to homeostatically self-organized quasicritical dynamics. Phys. Rev. Research 2, 012042. https://doi.org/10.1103/PhysRevResearch.2.012042

* Girardi-Schappo M, Bortolotto GS, Stenzinger RV, Gonsalves JJ, Tragtenberg MHR (2017) Phase diagrams and dynamics of a computationally efficient map-based neuron model. PLoS ONE 12(3): e0174621. https://doi.org/10.1371/journal.pone.0174621

* Girardi-Schappo M, Tragtenberg MHR, Kinouchi O (2013) Journal of Neuroscience Methods Volume 220, Issue 2, 15 November 2013, Pages 116-130. https://doi.org/10.1016/j.jneumeth.2013.07.014

# output of examples

* The KT(z) logistic and tanh maps

<table>
  <tr>
    <td><img alt="KTLog bifurcation over H" src="fig/ktlog_bif_H.png" width="250" /></td>
    <td><img alt="KTzLog bifurcation over xR" src="fig/ktzlog_bif_xR.png" width="250" /></td>
  </tr>
  <tr>
    <td><img alt="KTTanh bifurcation over H" src="fig/kttanh_bif_H.png" width="250" /></td>
    <td><img alt="KTzTanh bifurcation over xR" src="fig/bif_ktztanh.png" width="250" /></td>
  </tr>
</table>

* Mean-field E/I network

<table>
  <tr>
    <td><img alt="E-I network with a single time scale for self-organization" src="fig/phasediag_eq_taus.png.png" width="250" /></td>
    <td><img alt="E-I network with two time scales for self-organization" src="fig/phasediag_2taus.png.png" width="250" /></td>
  </tr>
</table>
