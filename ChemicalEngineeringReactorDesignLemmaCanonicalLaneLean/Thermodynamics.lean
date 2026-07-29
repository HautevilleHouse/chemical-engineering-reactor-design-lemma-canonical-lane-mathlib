import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ThermodynamicsPackage where
  enthalpy : Type u
  entropy : Type v
  gibbsFreeEnergy : Type w
  equilibriumConstant : Prop
  thermodynamicConsistency : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  equilibriumConstantClosed : T.equilibriumConstant
  thermodynamicConsistencyClosed : T.thermodynamicConsistency

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.equilibriumConstant ∧ T.thermodynamicConsistency

theorem thermodynamics_closed_from_evidence
    (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.equilibriumConstantClosed E.thermodynamicConsistencyClosed

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
