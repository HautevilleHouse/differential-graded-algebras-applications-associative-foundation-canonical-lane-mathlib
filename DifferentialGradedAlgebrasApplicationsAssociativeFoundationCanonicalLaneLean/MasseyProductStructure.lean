import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure MasseyProductPackage (D : DGAlgebraPackage) where
  tripleProductDefined : Prop
  wellDefinedUpToIndeterminacy : Prop
  quadrupleProductDefined : Prop
  coherenceConditions : Prop

structure MasseyProductEvidence (D : DGAlgebraPackage) (M : MasseyProductPackage D) where
  tripleProductDefinedClosed : M.tripleProductDefined
  wellDefinedUpToIndeterminacyClosed : M.wellDefinedUpToIndeterminacy
  quadrupleProductDefinedClosed : M.quadrupleProductDefined
  coherenceConditionsClosed : M.coherenceConditions

def MasseyProductClosed (D : DGAlgebraPackage) (M : MasseyProductPackage D) : Prop :=
  M.tripleProductDefined ∧ M.wellDefinedUpToIndeterminacy ∧
  M.quadrupleProductDefined ∧ M.coherenceConditions

theorem massey_product_closed_from_evidence (D : DGAlgebraPackage) (M : MasseyProductPackage D)
    (E : MasseyProductEvidence D M) : MasseyProductClosed D M := by
  exact And.intro E.tripleProductDefinedClosed
    (And.intro E.wellDefinedUpToIndeterminacyClosed
      (And.intro E.quadrupleProductDefinedClosed E.coherenceConditionsClosed))

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse