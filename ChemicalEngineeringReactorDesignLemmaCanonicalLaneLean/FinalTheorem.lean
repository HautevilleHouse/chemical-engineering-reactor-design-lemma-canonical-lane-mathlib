import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.ReactionKinetics
import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.MassTransfer
import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.ReactorDesign

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

def ConstrainedReactorDesignClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_reactor_design_endgame (A : AdmissibleClass) :
    ConstrainedReactorDesignClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse