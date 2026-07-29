import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ReactorSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ReactorAdmittedObject where
  space : ReactorSpace
  packedBedReactor : Prop
  pfrModelValid : Prop
  yieldModel : Type
  yieldTopology : TopologicalSpace yieldModel
  designYieldAchieved : Prop
  conclusion : designYieldAchieved

structure ReactorEndgameState where
  object : ReactorAdmittedObject

def ReactorWitnessClosed (O : ReactorAdmittedObject) : Prop :=
  O.designYieldAchieved

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
