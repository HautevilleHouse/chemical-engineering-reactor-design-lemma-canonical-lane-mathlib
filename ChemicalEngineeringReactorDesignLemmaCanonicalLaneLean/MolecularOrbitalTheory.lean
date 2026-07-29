import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure MolecularOrbitalTheoryPackage where
  orbitalHybridization : Type u
  frontierOrbitals : Type v
  homoLumoGap : Prop
  symmetryConservation : Prop
  orbitalMixing : Prop

structure MolecularOrbitalTheoryEvidence (M : MolecularOrbitalTheoryPackage) where
  homoLumoGapClosed : M.homoLumoGap
  symmetryConservationClosed : M.symmetryConservation
  orbitalMixingClosed : M.orbitalMixing

def MolecularOrbitalTheoryClosed (M : MolecularOrbitalTheoryPackage) : Prop :=
  M.homoLumoGap ∧ M.symmetryConservation ∧ M.orbitalMixing

theorem molecular_orbital_theory_closed_from_evidence
    (M : MolecularOrbitalTheoryPackage) (E : MolecularOrbitalTheoryEvidence M) :
    MolecularOrbitalTheoryClosed M := by
  exact And.intro E.homoLumoGapClosed
    (And.intro E.symmetryConservationClosed E.orbitalMixingClosed)

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
