import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ReactionKineticsModel where
  reactionRates : Type u
  activationEnergies : Type v
  temperatureDependence : Prop
  kineticMonotonicity : Prop
  equilibriumApproach : Prop
  temperatureDependenceTerm : temperatureDependence
  kineticMonotonicityTerm : kineticMonotonicity
  equilibriumApproachTerm : equilibriumApproach

structure ReactionKineticsEvidence (R : ReactionKineticsModel) where
  temperatureDependenceClosed : R.temperatureDependence
  kineticMonotonicityClosed : R.kineticMonotonicity
  equilibriumApproachClosed : R.equilibriumApproach

def ReactionKineticsClosed (R : ReactionKineticsModel) : Prop :=
  R.temperatureDependence ∧ R.kineticMonotonicity ∧ R.equilibriumApproach

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsModel)
    (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R := by
  exact And.intro E.temperatureDependenceClosed
    (And.intro E.kineticMonotonicityClosed E.equilibriumApproachClosed)

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
