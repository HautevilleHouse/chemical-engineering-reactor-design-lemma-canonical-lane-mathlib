import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ReactorWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
