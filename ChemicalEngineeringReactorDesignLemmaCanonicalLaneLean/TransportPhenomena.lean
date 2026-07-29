import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure TransportPhenomenaModel where
  massTransferCoefficient : Type u
  heatTransferCoefficient : Type v
  momentumTransfer : Type w
  convectiveDiffusion : Prop
  dispersionModel : Prop
  convectiveDiffusionTerm : convectiveDiffusion
  dispersionModelTerm : dispersionModel

structure TransportPhenomenaEvidence (T : TransportPhenomenaModel) where
  convectiveDiffusionClosed : T.convectiveDiffusion
  dispersionModelClosed : T.dispersionModel

def TransportPhenomenaClosed (T : TransportPhenomenaModel) : Prop :=
  T.convectiveDiffusion ∧ T.dispersionModel

theorem transport_phenomena_closed_from_evidence (T : TransportPhenomenaModel)
    (E : TransportPhenomenaEvidence T) : TransportPhenomenaClosed T := by
  exact And.intro E.convectiveDiffusionClosed E.dispersionModelClosed

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
