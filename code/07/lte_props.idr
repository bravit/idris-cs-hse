-- if not(x <= y) then (x > y)
not_lte__gt : Not (x `LTE` y) -> x `GT` y
not_lte__gt {x = Z} contra = absurd (contra LTEZero)
not_lte__gt {x = (S k)} {y = Z} contra = LTESucc LTEZero
not_lte__gt {x = (S k)} {y = (S j)} contra = 
  let gt_kj = not_lte__gt (\lte_kj => contra (LTESucc lte_kj))
  in (LTESucc gt_kj)

-- if x > y then y <= x
gt__lte : x `GT` y -> y `LTE` x 
gt__lte {y = Z} (LTESucc _) = LTEZero
gt__lte {y = (S k)} (LTESucc x) = LTESucc (gt__lte x)

-- if not(x <= y) then (y <= x)
not_lte__lte : Not (x `LTE` y) -> y `LTE` x 
not_lte__lte {x = Z} contra = absurd (contra LTEZero)
not_lte__lte {x = (S k)} {y = Z} contra = LTEZero
not_lte__lte {x = (S k)} {y = (S j)} contra = 
  let lte_jk = not_lte__lte (\lte_kj => contra (LTESucc lte_kj))
  in (LTESucc lte_jk)

