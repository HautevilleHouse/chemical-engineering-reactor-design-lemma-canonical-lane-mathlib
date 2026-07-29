import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ThermodynamicEquilibriumModel where
  chemicalEquilibrium : Prop
  phaseEquilibrium : Prop
  equilibriumConstant : Type u
  gibbsFreeEnergyMinimization : Prop
  activityCoefficientModel : Prop
  chemicalEquilibriumTerm : chemicalEquilibrium
  phaseEquilibriumTerm : phaseEquilibrium
  gibbsFreeEnergyMinimizationTerm : gibbsFreeEnergyMinimization
  activityCoefficientModelTerm : activityCoefficientModel

structure ThermodynamicEquilibriumEvidence (T : ThermodynamicEquilibriumModel) where
  chemicalEquilibriumClosed : T.chemicalEquilibrium
  phaseEquilibriumClosed : T.phaseEquilibrium
  gibbsFreeEnergyMinimizationClosed : T.gibbsFreeEnergyMinimization
  activityCoefficientModelClosed : T.activityCoefficientModel

def ThermodynamicEquilibriumClosed (T : ThermodynamicEquilibriumModel) : Prop :=
  T.chemicalEquilibrium ∧ T.phaseEquilibrium ∧
  T.gibbsFreeEnergyMinimization ∧ T.activityCoefficientModel

theorem thermodynamic_equilibrium_closed_from_evidence (T : ThermodynamicEquilibriumModel)
    (E : ThermodynamicEquilibriumEvidence T) : ThermodynamicEquilibriumClosed T := by
  exact And.intro E.chemicalEquilibriumClosed
    (And.intro E.phaseEquilibriumClosed
      (And.intro E.gibbsFreeEnergyMinimizationClosed E.activityCoefficientModelClosed))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
