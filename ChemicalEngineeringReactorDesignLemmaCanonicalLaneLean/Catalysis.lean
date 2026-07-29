import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure CatalysisPackage where
  catalystSurface : Type
  adsorptionIsotherm : Prop
  langmuirHinshelwood : Prop
  turnoverFrequency : Prop
  deactivationModel : Prop

structure CatalysisEvidence (C : CatalysisPackage) where
  adsorptionIsothermClosed : C.adsorptionIsotherm
  langmuirHinshelwoodClosed : C.langmuirHinshelwood
  turnoverFrequencyClosed : C.turnoverFrequency
  deactivationModelClosed : C.deactivationModel

def CatalysisClosed (C : CatalysisPackage) : Prop :=
  C.adsorptionIsotherm ∧ C.langmuirHinshelwood ∧ C.turnoverFrequency ∧ C.deactivationModel

theorem catalysis_closed_from_evidence (C : CatalysisPackage) (E : CatalysisEvidence C) :
    CatalysisClosed C := by
  exact And.intro E.adsorptionIsothermClosed (And.intro E.langmuirHinshelwoodClosed (And.intro E.turnoverFrequencyClosed E.deactivationModelClosed))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse