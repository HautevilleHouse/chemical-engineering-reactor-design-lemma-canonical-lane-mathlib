import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ChemicalEquilibriumPackage where
  equilibriumComposition : Type u
  reactionQuotient : Type v
  equilibriumShift : Prop
  leChatelierPrinciple : Prop
  massActionLaw : Prop

structure ChemicalEquilibriumEvidence (E : ChemicalEquilibriumPackage) where
  equilibriumShiftClosed : E.equilibriumShift
  leChatelierPrincipleClosed : E.leChatelierPrinciple
  massActionLawClosed : E.massActionLaw

def ChemicalEquilibriumClosed (E : ChemicalEquilibriumPackage) : Prop :=
  E.equilibriumShift ∧ E.leChatelierPrinciple ∧ E.massActionLaw

theorem chemical_equilibrium_closed_from_evidence
    (E : ChemicalEquilibriumPackage) (Ev : ChemicalEquilibriumEvidence E) :
    ChemicalEquilibriumClosed E := by
  exact And.intro Ev.equilibriumShiftClosed
    (And.intro Ev.leChatelierPrincipleClosed Ev.massActionLawClosed)

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
