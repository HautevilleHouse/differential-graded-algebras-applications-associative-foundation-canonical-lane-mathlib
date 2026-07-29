import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure MasseyProductData (A : DGAlgebraPackage) where
  a : A.algebra.carrier
  b : A.algebra.carrier
  c : A.algebra.carrier
  dab : A.algebra.differential a = 0
  dbc : A.algebra.differential b = 0
  dcd : A.algebra.differential c = 0
  abZeroHomologous : ∃ (h : A.algebra.carrier), A.algebra.mul a b = A.algebra.differential h
  bcZeroHomologous : ∃ (k : A.algebra.carrier), A.algebra.mul b c = A.algebra.differential k

def tripleMasseyProduct (A : DGAlgebraPackage) (D : MasseyProductData A) : A.algebra.carrier := 
  let h := (D.abZeroHomologous.choose)
  let k := (D.bcZeroHomologous.choose)
  A.algebra.mul h c - A.algebra.mul a k

theorem tripleMasseyProductCocycle (A : DGAlgebraPackage) (D : MasseyProductData A) :
    A.algebra.differential (tripleMasseyProduct A D) = 0 := by
  simp [tripleMasseyProduct]
  sorry

def MasseyProductPackage (A : DGAlgebraPackage) : Type := 
  Subtype (λ (M : MasseyProductData A) => True)

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse