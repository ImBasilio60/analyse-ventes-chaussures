ventes <- read.csv(
    "data/ventes.csv",
    stringsAsFactors = FALSE
)

ventes$chiffre_affaires <-  ventes$quantite * ventes$prix 

chiffre_affaires_total <- sum(ventes$chiffre_affaires)

quantites <- aggregate(
    quantite ~ produit,
    data = ventes,
    FUN = sum
)

produit_plus_vendu <- quantites[
    quantites$quantite == max(quantites$quantite),
]

prix_moyen <- mean(ventes$prix)

total_paires <- sum(ventes$quantite)

print(produit_plus_vendu)

library(ggplot2)

graphique <- ggplot(
    quantites,
    aes(x = produit, y = quantite)
) + geom_col() + labs(
    title="Quantité vendue par produit",
    x="Produit",
    y="Quantité"
)

ggsave(
    filename = "output/quantites_par_produit.png",
    plot = graphique,
    width = 8,
    height = 6,
    dpi = 300
)

print(graphique)