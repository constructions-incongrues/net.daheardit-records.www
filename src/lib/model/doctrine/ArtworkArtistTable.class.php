<?php

/**
 * ArtworkArtistTable
 *
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class ArtworkArtistTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object ArtworkArtistTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('ArtworkArtist');
    }

    public function findOneBySlugAndCulture($slug, $culture = 'fr')
    {
        $q = $this->createQuery('a')
            ->where('a.slug = ?', $slug)
            ->leftJoin('a.Translation t')
            ->andWhere('t.lang = ?', $culture);

        return $q->fetchOne();
    }
}