import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ChemicalEngineeringAdmittedObject where
  reactionKineticsClosed : Prop
  molecularOrbitalTheoryClosed : Prop
  thermodynamicsClosed : Prop
  chemicalEquilibriumClosed : Prop
  reactorDesignClosed : Prop

structure AdmissibleClass where
  object : ChemicalEngineeringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.reactionKineticsClosed ∧ A.object.molecularOrbitalTheoryClosed ∧
  A.object.thermodynamicsClosed ∧ A.object.chemicalEquilibriumClosed ∧
  A.object.reactorDesignClosed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
